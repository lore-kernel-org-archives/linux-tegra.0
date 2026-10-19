Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792451898;
	b=FVy2g7g2/AOcfSiZ+lDiA0y1FGZakLnYKoQ6Psn1Wg6wKRfJLA/A/IMMFCVNgvkdDAKz
	 LeEDpL7rsjeOEit8H5b6f/T7/KfqQdEyJGqdH1beBw62gTVQx+T13kfR9TNgeEnR0Qidv
	 O0bDWFzZvERLK2dojF0rIO5U6PjHAO1KnWms+bsnYoTBD1lftard+FRYsk+IXsUBWJAfl
	 6ZE1oD7k3D/pgJMXkb5yzhTcbTqv+yr8K+tsoB+1rI9oblNEvMFtghaCGB/UIul+u4SX0
	 k11P1KdKLIENsNqULIAY9zV40fs7AypYJ0VeCXdIEKM9yoqTxN7952aH+i1ejg4N0Lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792451898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xkEO/OSiRmfTcfnZn00ylSAwEOQz293NLx30J9yMRbI=;
	b=APBvCGsz84a0RIJER7S3l3SkVa4c9cfJHs9L4TaC9f5k06u5pcs6i0l/rQNHamCdDSE7
	 JVBCnG6Xo1L9/V7FDXL2SGhBg2vPujX6qyHvx4PD4gkERyIGCDKygv9h2AXYb/RvlAUXl
	 PwE3dLqc1kIZGi8uKLq86Y8SFzot/vmYimuVb9FK9ArcieVheQEzOZuF83/UYlsAmCiWJ
	 G4HWiJBqTnk39IAwegbMvSwam/iiSQj/kFZVsQPvzR+guw368kbWa2PYHqM02cA9QkLJP
	 U5qVASNtTkk76z87TdS1CbiopaWHpEzd11TrKN/rBzvwKELCK4cZ7koauw+WgcJMPXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lXSTaDUM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47247606A31C
	for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2026 23:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47247606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lXSTaDUM
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5337c7b9937so126531cf.0
        for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2026 16:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792451896; cv=none;
        d=google.com; s=arc-20260327;
        b=QqstTZ8kG1ynEpiTi45LteFE93uGcc/UXJ3zsjyBSNE26Dl46CSFQdu7mGD8+HlqMf
         0gYsVy/FS3k0cTFYZI9ptenHu6XrdAnpMo4vWKujklJdOZcBElitbUJpDHM1zeCY/HNh
         rS2d4BMXYNTcQE6SQZ7J6ezjsGK/L/h39FQKH1vnquuox/qKbZjAmgbE65lvtO+wevtS
         FrL2WIA5xLfzn7vdmVZrr/SQ3HjOkA3a4j2r3aKJYkkEXbaO8kaxgwJbfXe8cpwzM6wv
         cCFO53fSNBG8UtmfmdsGD4p6aUuYqrM1jo//UoWUb3HbvMyndqnvEZa7v6KbZoTQUljw
         +NIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xkEO/OSiRmfTcfnZn00ylSAwEOQz293NLx30J9yMRbI=;
        fh=ZqlLzLP5TgPYbN98FNi245hPiXhe6Yx6pKkD2pcGeTA=;
        b=JyI5Z9o1vlZYEnyy+ca5fOY5Lun5jvy9+fjzsDC0zkV+cVRJY/Ou288khvvh0USmmZ
         Vw1v8aCgwkHI7mws3xhHkU8CbLhm//YW2iDjkjYgfjmsV2hf1kppoKu3yY720jPGDHy/
         eVGMO11g3gIxh55SVzH8EpqTsID0Z/z/Cyvv/sxg4SUlVbMHMxHDIctQonqLLSiz+K/b
         sMICZACNhIePXLHW3rBu23lVQu1AFnwZPJ114JE4jCZ3v14hLhD+Eyp/6EnZxyC53xHj
         7JTTUu3dJ1061BSKSn4lzEhYVoHIFYjXGHhlPFi8Oln9xHY/kadOdTdgFJyuhBmQYF9d
         12VA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792451896; x=1793056696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xkEO/OSiRmfTcfnZn00ylSAwEOQz293NLx30J9yMRbI=;
        b=lXSTaDUMPxunqT4NG8XOu+6a4OArT7pDWEU93VGCHzg1SUOAWgq/AmOkvPZ3aWJjoE
         cwCm+bFLjJNw+1X6WCGZIwHMMve1j0ZTHgmSFGSnYMVvRX/GQ7rp5vwQjsw9MouTPbUP
         NDOCW5Oeeu7hEi8H4+OHFU5jWndcCD90gzXO2MltTiz6vQE/tsZpX+P4mw9qBLVAy5d/
         A28hrIIKE0NAix8sx6oabnORuMi4RxV6km6Dz7iL4jW3qQzf6OGFfYrGi4vMmOhPiyi4
         WqTpk2bsF9gC5zLdti+hAQ0R4DqeA0U0Fk2lCMo7++axBH8mFnEvVRw8jO0qZpA1cKX3
         1wYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792451896; x=1793056696;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkEO/OSiRmfTcfnZn00ylSAwEOQz293NLx30J9yMRbI=;
        b=RbKSdrmQzH7pi8r57C9yXFvKvXeiq1oMveNSXPrmwZmjXlyx5cuu7u4SRhgg1lBIew
         5Ua20RUi45DOX7uCp7ybris1+jr3ia3q8GB4F3PdBOEpCUJ/dDCVE/WgHYegfMk/FITq
         kXIdQS7XDr5Xayb8lQNgRuy/HArdLQuiFbaaok8uiI5H4a3i9tA9nPmq5Sy4k8M5PlZl
         tu2WEIskCO4SQ9MZLgHEqI9idvJ5sGz4/bsK6ntWUh244W2XrvxrwW+/iPxvwWNEtK3q
         EQaPfbB/CzYrvJn2p2w0aoxkFUn8VXmETQeSpBUy4OBOczDmXYUDK5LXfELORK5CQz/g
         ednQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1gh1tXn9nyK4T3uyCSvZDGifChbwbiTmRH+yESLo/PH04n3dDOZftgshcvqPcvx2YNeyjPJa+eUz0SA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIbPd4+YvD2ZTPVBn62e9q5PA+Qo059EFBDAMU8NdxPyqrvkEgQ
	hs5067IOeBqcpg0WRln/9bXJkwAHG9zgO8q614aXX/SU6z0FFyrh8HJTz6V474+Io6oWlP6QCW+
	4z7BECg7NPpywHJrjUmtVE+V3ui5Q9KsKWJ+CAtKt
X-Gm-Gg: AYBFou3Bz02LZQWfDtK5TTA3ZEZFlYjA/E7b5MCLfe1tuF6T0PLmIqJS4mVDjzy9ZLU
	7CLYZMXOV/L4o+cyglDqIuNAezg5tj2DZMQZVFS3ll/P3SGISgEkAXNJgRtPBXYsM3Csa+YpTx6
	UgS9jcip47slVfyRMERrGMz3t1JYYD2azVrVhTMHQNSkLrvosxXPMd9OeSbZpHHgwj9MvHHAu5u
	ilchIyptHouGwY5WVv7Ckeqidw2Kqr1/tYlxZYzXYIFREYro+jWBeAHSGMJmj3F4FNTFSQU6roU
	X3XGvxMGUUODrim9Ix6RMjO8re+g8c3/AoTTy0s41Lj0txjsVIvDEyE74Skh+NZVHX/muZXoAkB
	L5CtRC4E3g65bXYt4CoZ/467zra1cjVLa0zWR37OXd0UFU6uzS2vcBUCvEQ==
X-Received: by 2002:a05:622a:418c:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-53688361cc0mr3730081cf.14.1792451895603; Mon, 19 Oct 2026
 16:18:15 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019164241.403644-1-bwicaksono@nvidia.com> <20261019164241.403644-5-bwicaksono@nvidia.com>
In-Reply-To: <20261019164241.403644-5-bwicaksono@nvidia.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 19 Oct 2026 16:18:02 -0700
X-Gm-Features: AclHuK-P4jTEpdJSRDgE-1GK0BbwVAkaLE7mt8LMQ_UZz4JJYrKoVTt4WXDObg8
Message-ID: <CAP-5=fWucvdYefDOL3Vn=O=YUPEXE+tngDDfPLv-T5i3WkCJVA@mail.gmail.com>
Subject: Re: [PATCH 4/6] perf jevents: Add support for NVIDIA Tegra410
 PCIE-TGT PMU aliasing
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: acme@kernel.org, namhyung@kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vsethi@nvidia.com, rwiley@nvidia.com, 
	skelley@nvidia.com, mochs@nvidia.com, rajjoshi@nvidia.com, treding@nvidia.com, 
	jonathanh@nvidia.com, john.garry@linux.dev, will@kernel.org, 
	james.clark@linaro.org, mike.leach@arm.com, leo.yan@linux.dev, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, ctshao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 9:45=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
> Add alias support for NVIDIA Tegra410 PCIE-TGT PMU events and metrics.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>  .../nvidia/t410/sys/uncore-pcie_tgt.json      | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/unco=
re-pcie_tgt.json
>
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie=
_tgt.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie_tg=
t.json
> new file mode 100644
> index 000000000000..74786fc3d578
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie_tgt.js=
on
> @@ -0,0 +1,93 @@
> +[
> +    {
> +        "EventCode": "0x4",
> +        "EventName": "PCIE_TGT_CYCLES",
> +        "BriefDescription": "Counts cycles at the PCIe interface to the =
Tegra SoC data fabric.",
> +        "PublicDescription": "Counts cycles at the PCIe interface to the=
 Tegra SoC data fabric.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"

It looks like the PMU names are broken because of the _rc_ in their names:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/perf/arm_cspmu/nvidia_cspmu.c#n901
```
   .name_pattern =3D "nvidia_pcie_pmu_%u_rc_%u",
```
The convention is for either a numeric (preferable) or hexadecimal suffix:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/ABI/testing/sysfs-bus-event_source-devices
Extra information about the PMU belongs in a caps file.

By definition nothing can work with wildcard matching using the
existing PMU name, so please rename it. If a new suffix convention is
necessary then  you should update the ABI and perf tool suffix
matching logic like pmu_name_len_no_suffix:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/tools/perf/util/pmus.c#n65

Thanks,
Ian Rogers

>
> +    },
> +    {
> +        "EventCode": "0x2",
> +        "EventName": "PCIE_TGT_RD_REQ",
> +        "BriefDescription": "Counts read requests from any source to PCI=
e BAR or CXL HDM ranges under this PCIe root complex.",
> +        "PublicDescription": "Counts read requests from any source to PC=
Ie BAR or CXL HDM ranges under this PCIe root complex, where the target res=
ponds with data. Request size can be from 1 to 256 bytes. Filters: dst_rp_m=
ask selects PCIe BAR traffic to root ports (bit n =3D root port n). dst_add=
r_en with dst_addr_base and dst_addr_mask selects PCIe BAR or CXL HDM addre=
sses that equal the base in the mask's set bits. If both dst_rp_mask and th=
e address filter are set, a request matching either is counted. With no fil=
ter, PCIe BAR traffic to all root ports is counted.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x3",
> +        "EventName": "PCIE_TGT_WR_REQ",
> +        "BriefDescription": "Counts write requests from any source to PC=
Ie BAR or CXL HDM ranges under this PCIe root complex.",
> +        "PublicDescription": "Counts write requests from any source to P=
CIe BAR or CXL HDM ranges under this PCIe root complex, where the source se=
nds data. Request size can be from 1 to 256 bytes. Filters: dst_rp_mask sel=
ects PCIe BAR traffic to root ports (bit n =3D root port n). dst_addr_en wi=
th dst_addr_base and dst_addr_mask selects PCIe BAR or CXL HDM addresses th=
at equal the base in the mask's set bits. If both dst_rp_mask and the addre=
ss filter are set, a request matching either is counted. With no filter, PC=
Ie BAR traffic to all root ports is counted.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x0",
> +        "EventName": "PCIE_TGT_RD_BYTES",
> +        "BriefDescription": "Counts bytes transferred by the read reques=
ts counted by PCIE_TGT_RD_REQ.",
> +        "PublicDescription": "Counts bytes transferred by the read reque=
sts counted by PCIE_TGT_RD_REQ. Destination filters work as described for P=
CIE_TGT_RD_REQ.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x1",
> +        "EventName": "PCIE_TGT_WR_BYTES",
> +        "BriefDescription": "Counts bytes transferred by the write reque=
sts counted by PCIE_TGT_WR_REQ.",
> +        "PublicDescription": "Counts bytes transferred by the write requ=
ests counted by PCIE_TGT_WR_REQ. Destination filters work as described for =
PCIE_TGT_WR_REQ.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_tgt_freq",
> +        "MetricGroup": "PCIE_TGT_Frequency",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_TGT_CYCLES / aggr_nr(PCIE_TGT_CYCLES)) / 1e=
9 / duration_time",
> +        "ScaleUnit": "1GHz",
> +        "BriefDescription": "Frequency of the cycles at the PCIe interfa=
ce to the Tegra SoC data fabric.",
> +        "PublicDescription": "Average frequency of the cycles at the PCI=
e interface to the Tegra SoC data fabric over the measurement interval.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_tgt_avg_rd_bandwidth_to_all_dst",
> +        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR_CXL_HDM"=
,
> +        "MetricExpr": "PCIE_TGT_RD_BYTES@dst_addr_en=3D1,dst_addr_base=
=3D0,dst_addr_mask=3D0@ / 1e6 / duration_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth to all PCIe BAR and =
CXL HDM ranges under this PCIe root complex.",
> +        "PublicDescription": "Average read bandwidth of requests from an=
y source to all PCIe BAR and CXL HDM ranges under this PCIe root complex.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_tgt_avg_wr_bandwidth_to_all_dst",
> +        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR_CXL_HDM"=
,
> +        "MetricExpr": "PCIE_TGT_WR_BYTES@dst_addr_en=3D1,dst_addr_base=
=3D0,dst_addr_mask=3D0@ / 1e6 / duration_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth to all PCIe BAR and=
 CXL HDM ranges under this PCIe root complex.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ny source to all PCIe BAR and CXL HDM ranges under this PCIe root complex."=
,
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_tgt_avg_rd_bandwidth_to_pcie_bar",
> +        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR",
> +        "MetricExpr": "PCIE_TGT_RD_BYTES / 1e6 / duration_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth of PCIe BAR traffic =
to all root ports under this PCIe root complex.",
> +        "PublicDescription": "Average read bandwidth of PCIe BAR traffic=
 from any source to all root ports under this PCIe root complex.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_tgt_avg_wr_bandwidth_to_pcie_bar",
> +        "MetricGroup": "PCIE_TGT_Bandwidth;PCIE_TGT_BW_PCIE_BAR",
> +        "MetricExpr": "PCIE_TGT_WR_BYTES / 1e6 / duration_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth of PCIe BAR traffic=
 to all root ports under this PCIe root complex.",
> +        "PublicDescription": "Average write bandwidth of PCIe BAR traffi=
c from any source to all root ports under this PCIe root complex.",
> +        "Compat": "1070036b",
> +        "Unit": "nvidia_pcie_tgt_pmu_,rc_"
> +    }
> +]
> --
> 2.43.0
>
