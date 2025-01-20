# output in console the subscription id
output "subscription_id" {
  value = data.azurerm_subscription.current.id
}

output "subscription_name" {
  value = data.azurerm_subscription.current.display_name
}