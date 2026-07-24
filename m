Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49073A874F
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877526; cv=none; b=rY64P7J/xbHblFoXgMHWPQY6/z9I8m+VXty4tNud/B0xxg1qCSqVvMIZMXEgBk1esvJLQU132wc+NgUke1qsyihHO/uqevqnlpWHGE97Aw5jkYIQHARgwch73v/Oa3jWTDpeP56dOVZ3UXFxQkpxmTmg6W7zZU58zSOm0DBTUe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877526; c=relaxed/simple;
	bh=APRbG6owW9j48Kw8dBxDUUQwX3WHBh/Z4oDfNbO9pLs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QA2T8tom3qjFgYcORm2hwMpHYmfH1J1lPtFTEidxwsYZVWbjS3NDyuH2fQkf4B700vsYy3K0Gy5mBvy5zs0boH9p3n1ollKy499vRZZZM8hoI02LTrks7z5j9g68/6aT2XvVNugjEx8MSuXD/WXcaBCjsA1gVTW3uAi/2JS4+n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HOhjuEKe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iuwSvcc8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HOhjuEKe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iuwSvcc8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O5xTir1892447
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N8/2ht4KwurhFRqE2FyapG
	nob+xJqGXY6XxRwIz2OnE=; b=HOhjuEKe6FUP7wtulDfptSmPgmOBXUqmkKIFAF
	tGYLodS4iioYEb5gg3voPuj3S5O500YteFxLSfzIS4VM7Y8DMveboPvaliekcLRr
	MmuLt3+nekHszGTVAYIdYH2TOblRMR/rBVN8NZH2pEnt0GdIQUpB9ttlUP3Z/nDU
	iFyDMANNvgo56Hr6LPhxlO9Cc5kYDJa43rni5wiYErg1FXs+RXgrZ22kOpub/sLu
	KFv19G1HbGgMgj+pdOXDN824dATaWVOqmtjagZhEn86r3xzBQo1jZLWSm2qTIZp5
	wZW2qkmLZ03zLqBvw+CH2T8f719rjJU++Y46Xlg+rWzp0gJg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx89sm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 07:18:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cccfa32670so2265845ad.2
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2026 00:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877523; x=1785482323; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N8/2ht4KwurhFRqE2FyapGnob+xJqGXY6XxRwIz2OnE=;
        b=iuwSvcc8niPspKOcYZn4JpQxW65hm4AjfFIUHp7gl6GnJlnnMxfSqPkGdk8OEst7aU
         dQnbyXHIPulcGtwQ7KYrXTu6aiGg8swF0f9V3LeDkpKqx0Mgy0G3XUcRt2CpepVi16m8
         HbI9ZIDWax3trFdUnEybsVj0or6vS2KebfKscQtYH3/w1nFig7h/qcyRChX1WeznTWTc
         zRxHL3jch1GbdLz/ze3ehUoJgaIQ+EbflzsBS30arKNawuKuBj003olUhx4GFmEKyxYn
         SQsNpgS/nWSnFvQlA/Pg+Z7b0FgpTBcG9j8zysPnatfpy/iVjaSXjeZLgw46Gb3TPrVa
         q/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877523; x=1785482323;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N8/2ht4KwurhFRqE2FyapGnob+xJqGXY6XxRwIz2OnE=;
        b=nIJeGtnd6lvVm2SV7eGdqbJa+lIYpWW+F8a7zsUVYnIFumRLRCmeBL+FQKn2ryN03n
         O2XbUf2mCUGl3qNctvh2kDbByaAV1FGspkwgnax8n9GTCb8zeKC4tsfHrxaoK88Cx/ln
         32u++LrKEF0ciAYMjuW1r8o9pqlCNZ2aU0sUHXzAcCAFQwqWbRXTGRFlPAJUR/WML3Ux
         fKfDVINFjurbqKqzaLFYZZgZ0ONjmQfKUCaPGrO0N6DrOGqK7EOjE1y9gTLKA4dgdbrj
         E3YF25h0bJl96i1qG0iC3RFjHB5nwlcbqq+q9a6rgKmxsPOxpqXfW/800hVTeO1E4r1i
         oeeg==
X-Forwarded-Encrypted: i=1; AHgh+RrNPzHs6ojnR4sgneuPMEvnZz2wLpP6kZXZlFYFOdNSwShgcyUvPNOmrnOlL4fq8DAgRGSsjK8wZD27gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztMr86RZH7oY06JvgqNNHIdnVIjmRJfGGCrwP0o5bCI5Wcso5o
	FEMlY3Z1oIWS7WFVlPSINQD0LtQe15g0nQCp9xzf+57j+/Wsl70SEkvJVf1ZYqDlOeVSMf0OLQA
	PJKti/rvK48AmdiKEm0cY9Te6vADJNyiYqTNy18xxgi/nVKmFfoHETrdqdYD4KgyiNQ==
X-Gm-Gg: AR+sD11RLCB0jNYs3CPGX7MrESNGV5cWPcoR5nD9EhIEHHTd49tHVksoM2s0FqzkO1a
	iTvxUzEDwbPcIhEGUTwvfyxlzYfdY87BN9ItwMBD0LkAlKxjz/vU99uzoJvWHPSfdagmBPc5xLG
	8Z69ppfMtwXM3jY1hUsJYdAdqpFbWXcMxB28x0v7JGCZykRQ6f4TGt+FE7mtYAYUg1qUhYd8Kg7
	YEXwdzCoo3GN5GXXGYFFZCgfYnUy3Vl8JFJFRSyD3hemi9EZsuqi4WRcKQ8YOhCx05M8AD7jein
	Qm3ujmJ6/4zV43eNNAyUhwKcWOqPGkIBnKUSNN7bK6KEhZLKBUEZnD8bh9eh0L82oK5of3cnkBU
	awZAIjSd+PF/7p6tGkUsoEoPQnHR3Ei7cPDXWphimc4ieGyo7g8YDJVkzgFsiK07bzxZSs/Ks8p
	9TUUY6ZMK3J4yQYgdlmrIDqs6e/7Y=
X-Received: by 2002:a17:902:dac7:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2cfa6b73a76mr73503825ad.14.1784877523141;
        Fri, 24 Jul 2026 00:18:43 -0700 (PDT)
X-Received: by 2002:a17:902:dac7:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2cfa6b73a76mr73503045ad.14.1784877521701;
        Fri, 24 Jul 2026 00:18:41 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:18:41 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Subject: [PATCH RFC 00/10] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
Date: Fri, 24 Jul 2026 12:48:05 +0530
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK0RY2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMT3aK05Pgyi/ji5NzM+NzU3JzEEt2kZFPzRHMTcyMzY3MloMaCotS
 0zAqwodFKQW7OSrG1tQB93p2eaQAAAA==
X-Change-ID: 20260724-rfc_v8_scmi_memlat-bc57a7472637
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org, Amir Vajid <amir.vajid@oss.qualcomm.com>,
        Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>,
        Jia Yang <jia.yang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=13628;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=APRbG6owW9j48Kw8dBxDUUQwX3WHBh/Z4oDfNbO9pLs=;
 b=+4almlPx4CwejTf33N/x40M7XDwo3AQ7YqClU1Cs5G2PsQB+ZE7ASjcezYtJl/bSDx5yE6Pu3
 Xiy9ge2M2yqCAP2a43twPjMH41d0DRC/HojcWhKgy4jl8tvhL8IibHG
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-ORIG-GUID: mbXnSgnk4I5Guvja9_Nz2KKRq4GTAugD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX7plK47VgLUOx
 AVydtZzeteoRmeyNHeHIj2PG0qi3YpMWmc1uyHSpgiqQvoxitvbdBmlcSfUOGO8Q2a52Orp4xtH
 EGNE+NGSKEsFtxc59kaJvRFHv0w27UoXEV84DnLHdPV4z1Cq/3lvNKgGKC4DhLxV2PffS1NxolC
 CtWyefvxD4qLQOYJj1IW5T7d5OMtLGRqv+SDkhW4bsbR032UEvJ9r/LMiNJNaWqvTNZ4hE+mbWA
 nrftDVRdAFS23r6O1l/rK6o0k85SXbknx8y8+G52hiR8poyOe1Lj1x+Hhby9Bvnderxec87mekk
 2si30B+6ehapXcei0CFhZGUKJ0+YQDX7aWHLeCGRU20a6OUOou6f5/t4Jar1IM09viLYMJZfaun
 NnG9XFnHPcMxQyNdxR2Nt3DF22TqmJjsko6JbLepFGcBaEW0WQdYOPyPXh7nxpUaUr2qpwpdAvK
 V6Hnf0D/bIaOx9obHfw==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a6311d4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=N727Dw7Iak4MHyGCpZEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: mbXnSgnk4I5Guvja9_Nz2KKRq4GTAugD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX2XhACdaPGyo4
 LrrsG5Dko93pFPF3IjLlmi/Ppajj0LY2FMR2lz6NVLhljph8dApKVhqxFtz14kVZGxT2j/DLyCx
 jx9pQwp65/1ClTr03dP819r9w8jlios=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065

System Control Management Interface (SCMI) Qualcomm Generic Extension Protocol
consists of a small set of generic SET/GET/START/STOP commands, which is
used to turn on/off and configure Qualcomm SoC specific algorithms that run
on the SCP. Each algorithm is identified through an algorithm string and has
an immutable list of param_ids. All supported algorithms (currently just MEMLAT)
have their own dedicated section and are listed after the generic commands.

This series introduces the devfreq SCMI client driver that uses the MEMLAT
algorithm string hosted on the QCOM SCMI Generic Extension Protocol to detect
memory latency workloads and control frequency/level of the various memory
buses (DDR/LLCC/DDR_QOS). DDR/LLCC/DDR_QOS are modelled as devfreq devices
using the remote devfreq governor. This provides basic insight into device
operation via trans_stat and lets userspace further tweak the parameters of
the remote governor.

trans_stat data for DDR/LLCC/DDR_QOS is now available with this series:

     From  :   To
   315000000 479000000 545000000 725000000 840000000  959000000 1090000000 1211000000   time(ms)
   315000000:         0         3         6         6         6         7         0        30    143956
   479000000:         2         0         7         1         1         1         0         3       356
   545000000:         7         6         0         5         5         0         0        10      1200
   725000000:         3         0         5         0         6         1         0         6      2172
   840000000:         8         2         3         2         0         4         0        12      1188
   959000000:         3         0         1         2         2         0         0        13       272
  1090000000:         0         0         0         0         0         0         0         0         0
  1211000000:        35         4        11         5        11         8         0         0     21684
Total transition : 253

MEMLAT: Memory Latency algorithm

The MEMLAT algorithm (0x4d454d4c4154, ASCII "MEMLAT") scales the DDR, LLCC and
DDR_QOS buses in response to memory-latency-bound workloads. It runs on the CPUCP:
every sampling window it reads the per-CPU AMU counters, derives its statistics
(instructions-per-miss, back-end stall, write-back ratio), maps that to a target
level and votes for it directly on the DDR/LLCC/DDR_QOS interconnect. The kernel
never issues a frequency request in that loop. The 6-byte value is treated as a
64-bit algorithm string and split into two uint32 fields on the wire: algo_low
carries its lower 32 bits and algo_high its upper 32 bits.

With a distinct need to have the memory buses scaling done in SCP in response to
memory-latency-bound workloads, none of the existing SCMI solutions could be used
as-is. MPAM does not apply either: it is not enabled on all of the affected parts
(e.g. Hamoa). The role split between SCP and client driver is described next.

MEMLAT client driver pseudo-code:

  probe():
    SET_COMMON_EV_MAP                          # AMU events (all groups)
    for each memory group (DDR / LLCC / DDR_QOS):
      SET_MEM_GROUP                            # bind group to interconnect
      SET_GRP_EV_MAP                           # per-group AMU events
      for each monitor in the group:
        SET_MONITOR                            # topology, cpumask, name
        IPM_CEIL / BE_STALL_FLOOR              # per-monitor tuneables
        MON_FREQ_MAP                           # cpufreq -> memfreq map
        SET_MIN_FREQ / SET_MAX_FREQ            # clamps
    SAMPLE_MS                                  # sampling period
    SET_EFFECTIVE_FREQ_METHOD                  # cpu-freq derivation method
    START_TIMER                                # CPUCP now scales autonomously

  devfreq poll (twice per CPUCP sample period):
    GET_CUR_FREQ                               # read voted freq, per monitor

  remove():
    STOP_TIMER

SCP pseudo-code:

  every sample_ms:
    for each CPU:
      sample AMU counters (instructions, cycles, cache-misses, stalls)
      derive per-CPU IPM, back-end-stall % and write-back ratio

    for each configured memory group (DDR / LLCC / DDR_QOS):
      for each monitor in the group:
        best_freq = 0
        for each CPU in the monitor's cpumask:
          if CPU is memory-bound (IPM/stall/write-back vs. the
             monitor's configured thresholds):
            freq = CPU's cpufreq, optionally scaled toward the ceiling
            best_freq = max(best_freq, freq)
        monitor.target_freq = monitor's cpufreq->memfreq map(best_freq)

      group_vote = max(target_freq of every monitor in the group)
      if group_vote changed since the last sample:
        vote group_vote onto the group's interconnect path

  GET_CUR_FREQ returns a monitor's last target_freq
  START_TIMER / STOP_TIMER: resume / suspend the loop above

Thanks in advance for taking time to review the series.

Changes in v8:
 - Add memlat support for Kaanapali.
 - Express the cpufreq/memfreq map in MHz on both sides, matching the
   firmware wire format, dropping the kHz conversion and the DDR_QOS
   special case [Bjorn].
 - Build the on-wire messages directly from the static configuration
   instead of deep-copying it into heap mirror structs [Bjorn].
 - Anchor each memory bus's OPP table and devfreq device on a lightweight
   faux_device instead of a platform_device [Bjorn]; register the devfreq
   device non-devm with matching teardown on our own error paths, fixing a
   device/devfreq leak and use-after-free on unwind [Sashiko].
 - Switch param_ids to #defines (fixed wire tokens) and keep hw_type as
   the only enum; unit-suffix frequencies, add a memlat_set_param()
   helper and rename message locals for clarity [Bjorn].
 - Bound the vendor-protocol GET response copy against the caller
   buffer and skip the payload copy for zero-length transfers
   [Sashiko]; add an algorithm-string allowlist so the firmware never
   sees an unrecognised string [Sudeep].
 - Rewrite the driver Kconfig help and commit message around the
   CPUCP/kernel role split, and expand the MEMLAT documentation with
   the motivation for a vendor protocol and a call flow [Bjorn, Sudeep].
 - Fold scmi-qcom-memlat-cfg.h into the driver .c, laid out as
   definitions / per-SoC configuration / logic and driver boilerplate;
   add kernel-doc on the per-monitor tuneables (be_stall_floor, ipm_ceil,
   etc.) and reword the devfreq polling-interval comment to explain why
   half the CPUCP sample period is correct here [Bjorn].
 - Link to v7: https://lore.kernel.org/lkml/20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com/

Changes in v7:
 - Minor bug fixes and documentation improvements based on review feedback.
 - Significantly expand the QCOM Generic Vendor Protocol documentation
   with a dedicated MEMLAT section covering all param_ids, payloads and
   return values [Sudeep, Cristian].
 - Move per-SoC event IDs and hardware type identifiers from the driver
   into the platform configuration header.
 - Poll devfreq at twice the CPUCP sampling rate so every firmware voting
   cycle is reliably observed [Lukasz].
 - Add a devicetree binding schema for the Qualcomm SCMI vendor
   protocol@80 node.
 - Link to v6: https://lore.kernel.org/r/20260507062237.78051-1-sibi.sankar@oss.qualcomm.com

Changes in v6:
 - Combining vendor protocol and the client and moving it
   back into RFC mode.
 - Introduce target_freq attr flag and TRACK_REMOTE devfreq
   governor flag.
 - Add basic remote devfreq governor to give users data like
   transtat [Dmitry]
 - Drop the current design that relies on manual parsing of
   device tree data and move those into SoC specific structs
 - Add Glymur/Mahua/Hamoa/Purwa support in the same series.
 - Link to v5: https://lore.kernel.org/lkml/20241115011515.1313447-1-quic_sibis@quicinc.com/

 Changes in v5:
 - Splitting the series into vendor protocol and memlat client.
 - Also the move the memlat client implementation back to RFC
   due to multiple opens.
 - Use common xfer helper to avoid code duplication [Dmitry]
 - Update enum documentation without duplicate enum info [Dmitry]
 - Update the protol attributes doc with more information. [Cristian]
 - Link to v4: https://lore.kernel.org/lkml/20241007061023.1978380-1-quic_sibis@quicinc.com/

Changes in v4:
 - Restructure the bindings to mimic IMX [Christian]
 - Add documentation for the qcom generic vendor protocol [Christian/Sudeep]
 - Pick up Rb tag and fixup/re-order elements of the vendor ops [Christian]
 - Follow naming convention and folder structure used by IMX
 - Add missing enum in the vendor protocol and fix documentation [Konrad]
 - Add missing enum in the scmi memlat driver and fix documentation [Konrad]
 - Add checks for max memory and monitor [Shivnandan]
 - Fix typo from START_TIMER -> STOP_TIMER [Shivnandan]
 - Make populate_physical_mask func to void [Shivnandan]
 - Remove unecessary zero set [Shivnandan]
 - Use __free(device node) in init_cpufreq-memfreqmap [Christian/Konrad]
 - Use sdev->dev.of_node directly [Christian]
 - use return dev_err_probe in multiple places [Christian]
 - Link to v3: https://lore.kernel.org/lkml/20240702191440.2161623-1-quic_sibis@quicinc.com/

Changes in v3:
 - Drop container dvfs memlat container node. [Rob]
 - Move scmi-memlat.yaml to protocol level given that a lot of vendors might end up
 - using the same protocol number. [Rob]
 - Replace qcom,cpulist with the standard "cpus" property. [Rob]
 - Fix up compute-type/ipm-ceil required. [Rob]
 - Make driver changes to the accommodate bindings changes. [Rob]
 - Minor fixups in subjects/coverletter.
 - Minor style fixes in dts.
 - Link to v2: https://lore.kernel.org/lkml/20240612183031.219906-1-quic_sibis@quicinc.com/

Changes in v2:
 - Add missing bindings for the protocol. [Konrad/Dmitry]
 - Use alternate bindings. [Dmitry/Konrad]
 - Rebase on top of Cristian's "SCMI multiple vendor protocol support" series. [Cristian]
 - Add more documentation wherever possible. [Sudeep]
 - Replace pr_err/info with it's dev equivalents.
 - Mixed tabs and initialization cleanups in the memlat driver. [Konrad]
 - Commit message update for the memlat driver. [Dmitry]
 - Cleanups/Fixes suggested for the client driver. [Dmitry/Konrad/Cristian]
 - Use opp-tables instead of memfreq-tbl. [Dmitry/Konrad]
 - Detect physical cpu to deal with variants with reduced cpu count.
 - Add support for DDR_QOS mem_type.
 - Link to v1: https://lore.kernel.org/lkml/20240117173458.2312669-1-quic_sibis@quicinc.com/

Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
Jia Yang (1):
      arm64: dts: qcom: kaanapali: Enable LLCC/DDR/DDR_QOS DVFS

Pragnesh Papaniya (2):
      firmware: arm_scmi: Add SCMI QCOM Generic Extension Protocol documentation
      dt-bindings: firmware: arm,scmi: Add Qualcomm Generic Extension Protocol

Sibi Sankar (7):
      firmware: arm_scmi: vendors: Add QCOM SCMI Generic Extensions
      PM / devfreq: Add new target_freq attribute flag for governors
      PM / devfreq: Add new track_remote flag for governors
      PM / devfreq: Add a governor for tracking remote device frequencies
      PM / devfreq: Introduce the QCOM SCMI Memlat devfreq driver
      arm64: dts: qcom: glymur: Enable LLCC/DDR/DDR_QOS DVFS
      arm64: dts: qcom: hamoa: Enable LLCC/DDR/DDR_QOS DVFS

 Documentation/ABI/testing/sysfs-class-devfreq      |    8 +
 .../devicetree/bindings/firmware/arm,scmi.yaml     |    1 +
 .../bindings/firmware/qcom,generic-scmi.yaml       |   27 +
 MAINTAINERS                                        |   18 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   41 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |    4 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |   41 +
 drivers/devfreq/Kconfig                            |   23 +
 drivers/devfreq/Makefile                           |    2 +
 drivers/devfreq/devfreq.c                          |   27 +
 drivers/devfreq/governor_passive.c                 |    1 +
 drivers/devfreq/governor_performance.c             |    1 +
 drivers/devfreq/governor_powersave.c               |    1 +
 drivers/devfreq/governor_remote.c                  |   73 ++
 drivers/devfreq/governor_simpleondemand.c          |    1 +
 drivers/devfreq/governor_userspace.c               |    1 +
 drivers/devfreq/hisi_uncore_freq.c                 |    1 +
 drivers/devfreq/scmi-qcom-memlat-devfreq.c         | 1331 ++++++++++++++++++++
 drivers/devfreq/tegra30-devfreq.c                  |    3 +-
 drivers/firmware/arm_scmi/Kconfig                  |    1 +
 drivers/firmware/arm_scmi/Makefile                 |    1 +
 drivers/firmware/arm_scmi/vendors/qcom/Kconfig     |   15 +
 drivers/firmware/arm_scmi/vendors/qcom/Makefile    |    2 +
 .../arm_scmi/vendors/qcom/qcom-generic-ext.c       |  183 +++
 .../arm_scmi/vendors/qcom/qcom_generic.rst         |  954 ++++++++++++++
 include/linux/devfreq-governor.h                   |    8 +
 include/linux/devfreq.h                            |    1 +
 include/linux/scmi_qcom_protocol.h                 |   37 +
 28 files changed, 2806 insertions(+), 1 deletion(-)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260724-rfc_v8_scmi_memlat-bc57a7472637

Best regards,
-- 
Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>

