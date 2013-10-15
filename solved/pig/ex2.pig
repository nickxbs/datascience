-- Conta il numero di connessioni TCP VERSO google.it
A = LOAD '2012_04_12_10_58.log_tcp_complete.anonym' using PigStorage(' ') AS (ip_c:chararray,
port_c:int,
packets_c:int,
rst_c:int,
ack_c:int,
purack_c:int,
unique_bytes_c:long,
data_pkts_c:int,
data_bytes_c:long,
rexmit_pkts_c:int,
rexmit_bytes_c:long,
out_seq_pkts_c:int,
syn_c:int,
fin_c:int,
ws_c:int,
ts_c:int,
window_scale_c:int,
sack_req_c:int,
sack_sent_c:int,
mss_c:int,
max_seg_size_c:int,
min_seg_size_c:int,
win_max_c:int,
win_min_c:int,
win_zero_c:int,
cwin_max_c:long,
cwin_min_c:long,
initial_cwin_c:long,
average_rtt_c:double,
rtt_min_c:double,
rtt_max_c:double,
stdev_rtt_c:double,
rtt_count_c:int,
ttl_min_c:int,
ttl_max_c:int,
rtx_RTO_c:int,
rtx_FR_c:int,
reordering_c:int,
net_dup_c:int,
unknown_segments_c:int,
flow_control_c:int,
unnece_rtx_rto_c:int,
unnece_rtx_fr_c:int,
different_syn_seqno_c:int,
ip_s:chararray,
port_s:int,
packets_s:int,
rst_s:int,
ack_s:int,
purack_s:int,
unique_bytes_s:long,
data_pkts_s:int,
data_bytes_s:long,
rexmit_pkts_s:int,
rexmit_bytes_s:long,
out_seq_pkts_s:int,
syn_s:int,
fin_s:int,
ws_s:int,
ts_s:int,
window_scale_s:int,
sack_req_s:int,
sack_sent_s:int,
mss_s:int,
max_seg_size_s:int,
min_seg_size_s:int,
win_max_s:int,
win_min_s:int,
win_zero_s:int,
cwin_max_s:long,
cwin_min_s:long,
initial_cwin_s:long,
average_rtt_s:double,
rtt_min_s:double,
rtt_max_s:double,
stdev_rtt_s:double,
rtt_count_s:int,
ttl_min_s:int,
ttl_max_s:int,
rtx_RTO_s:int,
rtx_FR_s:int,
reordering_s:int,
net_dup_s:int,
unknown_segments_s:int,
flow_control_s:int,
unnece_rtx_rto_s:int,
unnece_rtx_fr_s:int,
different_syn_seqno_s:int,
completion_time:double,
first_time:double,
last_time:double,
C_first_payload:double,
S_first_payload:double,
C_last_payload:double,
S_last_payload:double,
C_first_ack:double,
S_first_ack:double,
first_time_abs:double,
c_internal:int,
s_internal:int,
connection_type:int,
p2p_type:int,
p2p_subtype:int,
ed2k_data:int,
ed2k_signaling:int,
ed2k_c2s:int,
ed2k_c2c:int,
ed2k_chat:int,
http_type:int,
ssl_client_hello:chararray,
ssl_server_hello:chararray,
dropbox_id:bytearray,
fqdn:chararray);

B = FILTER A BY fqdn matches '*.google.it';
C = GROUP B ALL;
D = FOREACH C GENERATE group, COUNT(B);
STORE D INTO 'output/ex2';

