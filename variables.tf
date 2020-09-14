variable "bucket_name" {
  description = "Bucket criado para armazenar logs e chaves"
}

variable "bucket_versioning" {
  default     = true
  description = "Habilita versionamento no bucket"
}

variable "bucket_force_destroy" {
  default     = false
  description = "Força remoção de bucket e seus objetos no terraform destroy"
}

variable "tags" {
  description = "Mapa de tags para atribuir os resources de modo geral"
  default     = {}
  type        = map(string)
}

variable "region" {}

variable "cidrs" {
  description = "Lista de CIDRs que podem acessar o bastion"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "is_lb_private" {
  description = "Se true o NLB será \"internal\" senão \"internet-facing\""
}

variable "vpc_id" {
  description = "Identificador da VPC onde o bastion será construído"
}

variable "bastion_host_key_pair" {
  description = "Key pair utilizada na contrução do bastion"
}

variable "hosted_zone_id" {
  description = "Nome da hosted zone onde o DNS name do bastion deve ser registrado"
  default     = ""
}

variable "bastion_record_name" {
  description = "DNS record para o bastion"
  default     = ""
}

variable "bastion_launch_template_name" {
  description = "Nome do template de launch configuration utilizado também pelo ASG"
  default     = "bastion-lt"
}

variable "bastion_ami" {
  type        = string
  description = "AMI utilizada pelo bastion"
  default     = ""
}

variable "elb_subnets" {
  type        = list(string)
  description = "Lista de subnets onde o NLB será construído"
}

variable "auto_scaling_group_subnets" {
  type        = list(string)
  description = "Lista de subnets onde o ASG irá construir as instâncias"
}

variable "associate_public_ip_address" {
  default = true
}

variable "bastion_instance_count" {
  default = 1
}

variable "create_dns_record" {
  description = "Quando true cria um DNS record para o bastion (LB). Se true 'hosted_zone_id' e 'bastion_record_name' se tornam obrigatórios"
}

variable "log_auto_clean" {
  description = "Ativa ou não o lifecycle do bucket"
  default     = false
}

variable "log_standard_ia_days" {
  description = "Número de dias antes de mover os logs para IA Storage"
  default     = 30
}

variable "log_glacier_days" {
  description = "Número de dias antes de mover os logs para o Glacier"
  default     = 60
}

variable "log_expiry_days" {
  description = "Número de dias antes de apagar os logs"
  default     = 90
}

variable "public_ssh_port" {
  description = "SSH port entre desktop e o bastion"
  default     = 22
}

variable "private_ssh_port" {
  description = "SSH port entre bastion e instância privada"
  default     = 22
}

variable "extra_user_data_content" {
  description = "Script adicional para passar para o bastion"
  type        = string
  default     = ""
}

variable "allow_ssh_commands" {
  description = "Quando 'True' permite a execução os comandos passados via SSH"
  type        = string
  default     = ""
}

variable "bastion_iam_policy_name" {
  description = "IAM Policy criado para o bastion ter acesso ao bucket"
  default     = "BastionHost"
}

variable "instance_type" {
  description = "Instance type do bastion"
  default     = "t3.nano"
}
