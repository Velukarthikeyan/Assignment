update mrp_production set ready_production='t', state='done' where name in('MO00039','MO00038','MO00040','MO00041','MO00064','MO00066','MO00079','MO00081')

select * from purchase_order where name in('PO00349', 'PO00703')

update purchase_order set signature_image_final_approver='t', signature_image_approver1='t', signature_image_approver2='t', state='finally_approved'
where name in('PO00349','PO00394','PO00504','PO00397','PO00370','PO00371','PO00399','PO00409','PO00402','PO00405','PO00407','PO00452','PO00372','PO00454','PO00490'
,'PO00373','PO00421','PO00390','PO00491','PO00433','PO00388','PO00560','PO00492','PO00449','PO00422','PO00467','PO00425','PO00428','PO00494','PO00505','PO00444',
'PO00444','PO00429','PO00391','PO00392','PO00495','PO00532','PO00533','PO00535','PO00496','PO00499','PO00500','PO00502','PO00503','PO00506','PO00507','PO00508','PO00509','PO00392',
'PO00395','PO00517','PO00518','PO00519','PO00520','PO00521','PO00522','PO00523','PO00536','PO00524','PO00526','PO00396','PO00430','PO00525','PO00527','PO00528','PO00529',
'PO00431','PO00537','PO00387','PO00530','PO00531','PO00463','PO00437','PO00384','PO00377');

SELECT * FROM HR_EMPLOYEE WHERE BIOMETRIC_EMPLOYEE_CODE='16261';

update purchase_order set signature_image_final_approver='t', signature_image_approver1='t', signature_image_approver2='t', state='finally_approved';

where name in('PO00493');

select * from product_template where name in ('NRE-13839A','NRE-17221A') and active='t'; 


select * from product_template where name='U-94-25-03240' and active='t';

update product_template set uom_id=15,uom_po_id=15 where name in('U-94-25-03240','U-ALPHA-1230');
update product_template set uom_id=43,uom_po_id=43 where name in('U-92-25-03151');

select count(*) from product_template where uom_id=1 and active='t';select * from product_uom;



update purchase_request set state='finally_approved',signature_image_final_approver='t' where state='pending_final_approval' and final_approver=37;

select product_category from product_template

update purchase_order set signature_image_final_approver='t', signature_image_approver1='t', signature_image_approver2='t', state='finally_approved'
where name in('PO01069','PO01071','PO01072');

update stock_move set designator=destinator where designator is null

