# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'bcrypt'

Role.create([
  { category: 'Agents', sub_category: 'Agent Data Extraction', url: '/admin/agent-data-extraction' },
  { category: 'Agents', sub_category: 'Agent Regional Managers', url: '/admin/agent-regional-managers' },
  { category: 'Agents', sub_category: 'Subagents', url: '/admin/subagents' },
  { category: 'Agents', sub_category: 'Agent Branch', url: '/admin/agent-branches' },
  { category: 'Agents', sub_category: 'Agent Branch Users', url: '/admin/agent-branch-users' },
  { category: 'Agents', sub_category: 'Agent Regions', url: '/admin/agent-regions' },
  { category: 'Applications', sub_category: 'Application Status', url: '/admin/applications' },
  { category: 'Applications', sub_category: 'Policy Issuance', url: '/admin/policy-issuance' },
  { category: 'Applications', sub_category: 'Follow-Up Email', url: '/admin/followup-email' },
  { category: 'Applications', sub_category: 'Online Applications', url: '/admin/online-applications' },
  { category: 'Applications', sub_category: 'Corporate', url: '/admin/corporate-applications' },
  { category: 'Applications', sub_category: 'OFW Applications', url: '/admin/ofw-applications' },
  { category: 'Applications', sub_category: 'Paid Policies', url: '/admin/upload-paid-policies' },
  { category: 'Applications', sub_category: 'Application Screening', url: '/admin/applications-screening/screening' },
  { category: 'Applications', sub_category: 'Upload Policies', url: '/admin/upload-policies' },
  { category: 'Applications', sub_category: 'Shipments', url: '/admin/shipments' },
  { category: 'Applications', sub_category: 'Deliveries', url: '/admin/deliveries' },
  { category: 'Applications', sub_category: 'Converted Applications', url: '/admin/converted-applications' },
  { category: 'Applications', sub_category: 'Follow-Up Signature', url: '/admin/followup-signature' },
  { category: 'Applications', sub_category: 'C2C', url: '/admin/motor-insurance/c2c' },
  { category: 'Applications', sub_category: 'CTPL', url: '/admin/motor-insurance/ctpl' },
  { category: 'Billing', sub_category: 'E-Billing', url: '/admin/e-billings' },
  { category: 'Billing', sub_category: 'Regular Billing', url: '/admin/regular-billing' },
  { category: 'Billing', sub_category: 'Credit Card Billing', url: '/admin/credit-card-billings' },
  { category: 'Billing', sub_category: 'Corporate Billing', url: '/admin/corporate-billings' },
  { category: 'Calls', sub_category: 'Follow-Up Call', url: '/admin/followup-call' },
  { category: 'Calls', sub_category: 'Quotation Call', url: '/admin/quotations' },
  { category: 'Content', sub_category: 'Policy Provision', url: '/admin/policy-provisions' },
  { category: 'Content', sub_category: 'Blogs', url: '/admin/blogs' },
  { category: 'Content', sub_category: 'Page Manager', url: '/admin/page-managers' },
  { category: 'Content', sub_category: 'File Storage', url: '/admin/file_storages' },
  { category: 'Lookups', sub_category: 'C2c Group Policy Product Line', url: '/admin/c2c-group-policy-product-lines' },
  { category: 'Lookups', sub_category: 'C2c Group', url: '/admin/c2c-groups' },
  { category: 'Maintenance', sub_category: 'Agent', url: '/admin/agents' },
  { category: 'Maintenance', sub_category: 'Policy Status', url: '/admin/policy-status' },
  { category: 'Maintenance', sub_category: 'Email Campaign Blast', url: '/admin/email-campaigns' },
  { category: 'Maintenance', sub_category: 'Upload Policy Status', url: '/admin/offline-policy-statuses' },
  { category: 'Maintenance', sub_category: 'Data Extraction', url: '/admin/data-extraction' },
  { category: 'Maintenance', sub_category: 'Branch', url: '/admin/branches' },
  { category: 'Maintenance', sub_category: 'Advertisers', url: '/admin/advertisers' },
  { category: 'Maintenance', sub_category: 'Payment Transactions', url: '/admin/payment-transactions' },
  { category: 'Maintenance', sub_category: 'Download Issued Policies', url: '/admin/download-issued' },
  { category: 'Maintenance', sub_category: 'Admin Configurations', url: '/admin/admin_configurations' },
  { category: 'Maintenance', sub_category: 'Campaign Sources', url: '/admin/sales-campaign-sources' },
  { category: 'Maintenance', sub_category: 'Email Notification Recipients', url: '/admin/email-notification-recipients' },
  { category: 'Maintenance', sub_category: 'User Roles', url: '/admin/roles' },
  { category: 'Maintenance', sub_category: 'User Account', url: '/admin/users' },
  { category: 'Products', sub_category: 'Product', url: '/admin/products' },
  { category: 'Products', sub_category: 'Rates', url: '/admin/rates' },
  { category: 'Products', sub_category: 'Plan', url: '/admin/plans' },
  { category: 'Products', sub_category: 'Product Line', url: '/admin/product-lines' },
  { category: 'References', sub_category: 'Vehicle Market Value', url: '/admin/vehicle-market-value' },
  { category: 'References', sub_category: 'Sources', url: '/admin/sales-sources' },
  { category: 'References', sub_category: 'Series Range', url: '/admin/series-range' },
  { category: 'References', sub_category: 'Sales Channels', url: '/admin/sales-channels' },
  { category: 'References', sub_category: 'Campaigns', url: '/admin/sales-campaigns' },
  { category: 'References', sub_category: 'Roadside', url: '/admin/roadside' },
  { category: 'References', sub_category: 'Vehicle Basic Premium', url: '/admin/vehicle_basic_premia' },
  { category: 'Reports', sub_category: 'Summary Collection', url: '#' },
  { category: 'Maintenance', sub_category: 'Edit User', url: '/admin/users//edit'},
  { category: 'Account', sub_category: 'Change My Password', url: '/admin/change-my-password'},
  { category: 'Maintenance', sub_category: 'Edit Role', url: '/admin/edit_user_role/'}
])

Agent.create([
  { cde: '1234', fullname: 'MLHUILLIER' },
  { cde: '12345', fullname: 'WODEL' }
])
