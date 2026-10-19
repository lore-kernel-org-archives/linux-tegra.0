Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792432245;
	b=dq7bXSzIMWC6Fr8ulaMxax30dGskndHW8OjdilLwQDMMDkk4rm54mXfeCWlMaIx4LzEE
	 UDUUIgspS5AT+d9qC2VwxNksCdd7Z300Rj82qdWFgASi04Iv/fVgdwQlEQP7hFM45++D4
	 FIX5BAxw3qxX+tjAdKbun8MaX5CGPCQGp/Z8tEX3+yq+QzLh+j6sVPNg9s4k3fJjw7BaE
	 0hjRLXFd3np+cQo9g3tgTVyO5tUmMF3KypSNfA7zEP8LGSSkh3Vmx9IU77n5RMRbWa5WQ
	 b7Q1PK9mTxaSKXJEucf+YzdBjFD8J6gJOh9+UGu1qvGsI4cFmGOWyzGFsWgkcMfjkWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yxr3yy5APwTjGC/8MQQ5vWLHB19nNrJrEZoaHSPj4Ms=;
	b=2iP8rjlHxnZLDdcZPLi1IgWPumG7vohyaciM/qnvU8WaoXpG8Xs/Oakg5OofM8HBLEjV
	 qxjBH7csCP/gR4bLn4hGqbmfMlWYjGVuhIcEIx5rg3WochRI1bqnw/Vg7rcIJ9Af/qgM5
	 MRBM4gDsN+ABA5UiJaHnUYUtwpzD9+nP7ZzbA1llfU0cV+Wg768CAMR8iqa0vFca6TOID
	 zwL/XZ/Jb//urHDSbPd4dD/2eudNkFN23qts5mRQH/9eSG+gZBJ5X8jGF94roxZyQ+OnQ
	 Mo8gTJlhf6u+HS4+dzUfCKhM/GM32YD3jrhDDNRcNClaOQmDGX4JsgXb56frUnqn0lQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=j2iiDKcQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723E2606A31A
	for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2026 17:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 723E2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=j2iiDKcQ
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so1306686c88.1
        for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2026 10:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792432243; cv=none;
        d=google.com; s=arc-20260327;
        b=dy1jwjODJqG7++G45tGQ4rCs+2Ai9afOMCcvSso7QBvJ0LYf42D44Z0/Yfjkrp6yR2
         TAR6gnej1vMwlU+H5i15ChEch1wx3HoI/qXw8d6ycmzbzPDsMO2xit5E6sU6e8kY7zc2
         kaPFTxC/IeGaWYPF2flcKdG6SdC5piXUqit0+uWiLTulXW1wySRwfyxOzJD0bnR8cAas
         n+9NcQubD7UI3E/6z7UucYleya74oZdsHoqvo6FDhdsbxsJgb9g+Dtakb83ErCmxCi5/
         vIVfAPZf4RFY/orhbE3oasTIx0MlwNbHpx1mqD7PYQw9yaj5hzGjlR+2VrPvrrn84KnO
         eaBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yxr3yy5APwTjGC/8MQQ5vWLHB19nNrJrEZoaHSPj4Ms=;
        fh=cMUNKUy7vrRSrD86qRzUlgC2ZMLapDESl0gPUXSHmtw=;
        b=YrEq6S2yFdcPU5BWEeDMfTXFQUs41gX3XVM2hIwjWDz5yU85jopvno2YHieE2JrjzX
         FRj1TUSDHyE2GapZmF24PToTmqpblE7wlmrXeK/CSJGb45jlZVVY3kvww7ywke40yAd5
         t95qVQiQooWvL0hrWbOiYDRGdMRnS/divkOpN04i+5Ze+N/gXI9JgU9UqPihdqYC/oXT
         QtVJ+cqx9CqbRmM0u763MXWB+R4NUAAMCk4phD66um+iSu8CprPkRKaEigSk+c4JeWlE
         6iFpEpLZ5IORENCb6V+mRgaFEd+VftW3q0C6IX9HPemef/1QrfA1OLQybI/MCrdgSI61
         /1lA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792432243; x=1793037043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yxr3yy5APwTjGC/8MQQ5vWLHB19nNrJrEZoaHSPj4Ms=;
        b=j2iiDKcQDsX+uhHSqWd7M9mreMk8q+bmRtgD5JMM3DFDRshn4XLktSq4Yz0klAiFTx
         J8P8h7fBgca0XZ+an1unsmNNic1i6Uu7/ZPGwRUMlXvyyl812PF67SVitWwb2NsbyiZH
         2ltH2QJEQc3KwjvzODXrvoHlOpUFKZ+U2/RkojDyUfJ1OIT/1usaBeRtJpqixkIIHPu7
         m0CZqJ3JnFXh9yY1l+rr0eTrBEJ8X02lS0ZMD+jDnFb1mBJ2oSNjkzxqj7LilDQEVJWV
         iPJi8zMbbTabUoFWhJ64ICQ787PbAs365YFioGD7+N7yPArBzJ6vQKzrfimL7fZdi0WZ
         RwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792432243; x=1793037043;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxr3yy5APwTjGC/8MQQ5vWLHB19nNrJrEZoaHSPj4Ms=;
        b=WYSztvikVS3RqDwRr0I/pp9YcKctqSK45GdBRgsEI7PzQpKFgWVHlTCEIGh3r11dJA
         a4hz0xKvtBkxcfQ+h4L8+12jfzTpxrhUJDrqByPwi8QgvuJbphT1e2x/R6yzjDbN/do+
         GFQ2QZjv0Os/08l/qiJEn/9XTizGDbvCjp3aFoZgnTqEGHql6pB9oEf1BT80qTgFB9Z+
         wfSroo+ACdaL8BPo45I6Kw8l9VrjRNjeyRJ0zXjVGuEcGcrdwEyl8HOykgb2GeASvugr
         8xDtxJrB2mcCYlUCZoBiE/bdzIFx76oGZy0gb+Qj3vs3vuc3gk+acpfwokL8NidkuyPW
         irMA==
X-Forwarded-Encrypted: i=1; AKwUvBzxpoljF1XsBr2ZBMRUWseMRtr0Wobsd4HadnQU1JGNas0i5pUIf8WhDZdQ2k5vD9Djx5b6all/c0SCAw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI5NPs8rRyO/Lzd+9U8wALAoYWg0fOXrlmwcy3SEVKtspGe9xE5
	cLWq86mZfLTvTHYf2dTPwTPKXgKS89spZx7Gb3JnrJ+bH25FPdsfBF/inGX9SLzbR+lAemCIvDi
	vfL7fcmv/DRg5mew6M9xHkraA+c++z7cYMjtoLRVI
X-Gm-Gg: AYBFou0aUVFxTXtUskNPAql6gtEgkSl3ktAEJ+hAho98uOHCMx73BkHTQv4HzxiWTbY
	8Kw/ym1UMtBJ0ZoAC4MdcYJdMt3ROZYPH7phAeWcbA3rvu+t1lStjJe7e3mcuhCEUktOA12K0VZ
	lnbG575g+splF3VMLehQ5uL7hx51Cp0GHl45HNjIWu4Lukvb6mz9nUvdmgMtheoSieGJ51CsX3O
	oOTMgf5SjOYNlKnIevel4jKcFRYaSlWPNT5q/+2l+Xp2BMQU46v2+CTavlSsDwtD12094moiLfv
	4MPgibTzJDvf6600Wls30ODVZmGjRUAiIxZl3krgqlSijOt6jEfZBriFhVFXEtgo3tKXoq4LbEz
	zMkbwGVMUVg==
X-Received: by 2002:a05:7023:901:b0:138:30b1:4c00 with SMTP id
 a92af1059eb24-1850c40d8d0mr14069971c88.3.1792432242358; Mon, 19 Oct 2026
 10:50:42 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019164241.403644-1-bwicaksono@nvidia.com> <20261019164241.403644-4-bwicaksono@nvidia.com>
In-Reply-To: <20261019164241.403644-4-bwicaksono@nvidia.com>
From: Chun-Tse Shao <ctshao@google.com>
Date: Mon, 19 Oct 2026 10:50:03 -0700
X-Gm-Features: AclHuK-k9em4UinzRLY1SwpkrF-Fn3v95lx1FapCdO9mAXeOsitZvqSqnBbEdcc
Message-ID: <CAJpZYjURztEO088Z4ms01UmxST+OYD5-t9u4ymGe-iig9jO_jg@mail.gmail.com>
Subject: Re: [PATCH 3/6] perf jevents: Add support for NVIDIA Tegra410 PCIE
 PMU aliasing
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: acme@kernel.org, namhyung@kernel.org, irogers@google.com, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, mochs@nvidia.com, 
	rajjoshi@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, 
	john.garry@linux.dev, will@kernel.org, james.clark@linaro.org, 
	mike.leach@arm.com, leo.yan@linux.dev, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Besar,

Thanks for the series. I tested this on a 2-socket Tegra410. With
--metric-only, each PCIe metric shows up once per socket, with `nan`
("none" with -j) in the other socket's column, so -j has the same key
twice in each row. "counters" is also 0 for socket 1, because it comes
from the first event, which belongs to socket 0:

```
$ perf stat -a --per-socket -M pcie_avg_wr_bandwidth_to_all_dst -j
--metric-only -- sleep 1
{"socket" : "S268435456", "counters" : 6, "MB/s
pcie_avg_wr_bandwidth_to_all_dst" : "0.1", "MB/s
pcie_avg_wr_bandwidth_to_all_dst" : "none"}
{"socket" : "S285212672", "counters" : 0, "MB/s
pcie_avg_wr_bandwidth_to_all_dst" : "none", "MB/s
pcie_avg_wr_bandwidth_to_all_dst" : "0.9"}
```

As in [1], a single PMU per RC with cpumask `0,88`, or the socket last
in the PMU name, would fix this.

[1] https://lore.kernel.org/linux-perf-users/CAJpZYjWLRiyNbzoGpA-2KE0zHgQn2=
gc0V943WxJEr5K5aZtRYA@mail.gmail.com/

Thanks,
CT

On Mon, Oct 19, 2026 at 9:45=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
> Add alias support for NVIDIA Tegra410 PCIE PMU events and metrics.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>  .../arm64/nvidia/t410/sys/uncore-pcie.json    | 247 ++++++++++++++++++
>  1 file changed, 247 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/unco=
re-pcie.json
>
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie=
.json b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie.json
> new file mode 100644
> index 000000000000..37c3eac305e5
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/sys/uncore-pcie.json
> @@ -0,0 +1,247 @@
> +[
> +    {
> +        "EventCode": "0x100000000",
> +        "EventName": "PCIE_CYCLES",
> +        "BriefDescription": "Counts cycles at the PCIe interface to the =
Tegra SoC data fabric.",
> +        "PublicDescription": "Counts cycles at the PCIe interface to the=
 Tegra SoC data fabric.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x2",
> +        "EventName": "PCIE_RD_REQ",
> +        "BriefDescription": "Counts read requests from PCIe devices unde=
r this PCIe root complex to memory or another PCIe device.",
> +        "PublicDescription": "Counts read requests from PCIe devices und=
er this PCIe root complex to memory or another PCIe device, where the targe=
t responds with data. Request size can be from 1 to 256 bytes. Filters: src=
_rp_mask selects the requesting root ports. Alternatively, src_bdf with src=
_bdf_en selects one requesting device (BDF); it cannot be combined with src=
_rp_mask and applies to all counters of this PMU. Destination filters selec=
t the memory type of the request address: dst_loc_cmem local CMEM, dst_loc_=
gmem local GMEM, dst_loc_pcie_p2p local PCIe peer addresses, dst_loc_pcie_c=
xl local CXL memory, dst_rem remote memory. This is the address's home type=
, not where the data currently resides; local or remote is determined by th=
e home socket of the address. An unset source filter counts all root ports;=
 an unset destination filter counts all destinations.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x3",
> +        "EventName": "PCIE_WR_REQ",
> +        "BriefDescription": "Counts write requests from PCIe devices und=
er this PCIe root complex to memory or another PCIe device.",
> +        "PublicDescription": "Counts write requests from PCIe devices un=
der this PCIe root complex to memory or another PCIe device, where the PCIe=
 device sends data. Request size can be from 1 to 256 bytes. Filters: src_r=
p_mask selects the requesting root ports. Alternatively, src_bdf with src_b=
df_en selects one requesting device (BDF); it cannot be combined with src_r=
p_mask and applies to all counters of this PMU. Destination filters select =
the memory type of the request address: dst_loc_cmem local CMEM, dst_loc_gm=
em local GMEM, dst_loc_pcie_p2p local PCIe peer addresses, dst_loc_pcie_cxl=
 local CXL memory, dst_rem remote memory. This is the address's home type, =
not where the data currently resides; local or remote is determined by the =
home socket of the address. An unset source filter counts all root ports; a=
n unset destination filter counts all destinations.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x0",
> +        "EventName": "PCIE_RD_BYTES",
> +        "BriefDescription": "Counts bytes transferred by the read reques=
ts counted by PCIE_RD_REQ.",
> +        "PublicDescription": "Counts bytes transferred by the read reque=
sts counted by PCIE_RD_REQ. Source and destination filters work as describe=
d for PCIE_RD_REQ.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x1",
> +        "EventName": "PCIE_WR_BYTES",
> +        "BriefDescription": "Counts bytes transferred by the write reque=
sts counted by PCIE_WR_REQ.",
> +        "PublicDescription": "Counts bytes transferred by the write requ=
ests counted by PCIE_WR_REQ. Source and destination filters work as describ=
ed for PCIE_WR_REQ.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "EventCode": "0x4",
> +        "EventName": "PCIE_RD_CUM_OUTS",
> +        "BriefDescription": "Accumulates the outstanding read requests c=
ounted by PCIE_RD_REQ each cycle at the PCIe interface.",
> +        "PublicDescription": "Accumulates the outstanding read requests =
counted by PCIE_RD_REQ each cycle at the PCIe interface. Pair the two under=
 the same filters for the average read latency. Source and destination filt=
ers work as described for PCIE_RD_REQ.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_freq",
> +        "MetricGroup": "PCIE_Frequency;PCIE_Read_Latency",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_CYCLES / aggr_nr(PCIE_CYCLES)) / 1e9 / dura=
tion_time",
> +        "ScaleUnit": "1GHz",
> +        "BriefDescription": "Frequency of the cycles at the PCIe interfa=
ce to the Tegra SoC data fabric.",
> +        "PublicDescription": "Average frequency of the cycles at the PCI=
e interface to the Tegra SoC data fabric over the measurement interval.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_all_dst",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_To_All_Destinations",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_loc_cmem=3D1,dst_loc_gmem=3D1,d=
st_loc_pcie_p2p=3D1,dst_loc_pcie_cxl=3D1,dst_rem=3D1@ / 1e6 / duration_time=
",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to all destinations.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to all destinations: local CMEM=
, local GMEM, local PCIe peer addresses, local CXL memory and remote memory=
.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_all_dst",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_To_All_Destinations",
> +        "MetricExpr": "PCIE_WR_BYTES@dst_loc_cmem=3D1,dst_loc_gmem=3D1,d=
st_loc_pcie_p2p=3D1,dst_loc_pcie_cxl=3D1,dst_rem=3D1@ / 1e6 / duration_time=
",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to all destinations.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to all destinations: local CME=
M, local GMEM, local PCIe peer addresses, local CXL memory and remote memor=
y.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_all_dst",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_To_All_Destinations",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_loc_cmem=3D1,dst_loc_gmem=
=3D1,dst_loc_pcie_p2p=3D1,dst_loc_pcie_cxl=3D1,dst_rem=3D1@ / PCIE_RD_REQ@d=
st_loc_cmem=3D1,dst_loc_gmem=3D1,dst_loc_pcie_p2p=3D1,dst_loc_pcie_cxl=3D1,=
dst_rem=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to all destinations.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to all destinations: local CMEM, =
local GMEM, local PCIe peer addresses, local CXL memory and remote memory."=
,
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_local_cmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Read;PCIE_To_Local_CMEM",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_loc_cmem=3D1@ / 1e6 / duration_=
time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to local CMEM.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to local CMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_local_cmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Write;PCIE_To_Local_CMEM",
> +        "MetricExpr": "PCIE_WR_BYTES@dst_loc_cmem=3D1@ / 1e6 / duration_=
time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to local CMEM.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to local CMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_local_cmem",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_Read;PCIE_To_Local_CMEM",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_loc_cmem=3D1@ / PCIE_RD_REQ=
@dst_loc_cmem=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to local CMEM.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to local CMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_local_gmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Read;PCIE_To_Local_GMEM",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_loc_gmem=3D1@ / 1e6 / duration_=
time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to local GMEM.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to local GMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_local_gmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Write;PCIE_To_Local_GMEM",
> +        "MetricExpr": "PCIE_WR_BYTES@dst_loc_gmem=3D1@ / 1e6 / duration_=
time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to local GMEM.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to local GMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_local_gmem",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_Read;PCIE_To_Local_GMEM",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_loc_gmem=3D1@ / PCIE_RD_REQ=
@dst_loc_gmem=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to local GMEM.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to local GMEM.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_local_cxlmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Read;PCIE_To_Local_CXLMEM",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_loc_pcie_cxl=3D1@ / 1e6 / durat=
ion_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to local CXL memory.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to local CXL memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_local_cxlmem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Write;PCIE_To_Local_CXLMEM",
> +        "MetricExpr": "PCIE_WR_BYTES@dst_loc_pcie_cxl=3D1@ / 1e6 / durat=
ion_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to local CXL memory.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to local CXL memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_local_cxlmem",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_Read;PCIE_To_Local_CXLMEM=
",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_loc_pcie_cxl=3D1@ / PCIE_RD=
_REQ@dst_loc_pcie_cxl=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to local CXL memory.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to local CXL memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_remote_mem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Read;PCIE_To_Remote_Memory",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_rem=3D1@ / 1e6 / duration_time"=
,
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to remote memory.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to remote memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_remote_mem",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Write;PCIE_To_Remote_Memory"=
,
> +        "MetricExpr": "PCIE_WR_BYTES@dst_rem=3D1@ / 1e6 / duration_time"=
,
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to remote memory.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to remote memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_remote_mem",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_Read;PCIE_To_Remote_Memor=
y",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_rem=3D1@ / PCIE_RD_REQ@dst_=
rem=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to remote memory.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to remote memory.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_bandwidth_to_local_pcie_peer",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Read;PCIE_To_Local_PCIE_Peer=
",
> +        "MetricExpr": "PCIE_RD_BYTES@dst_loc_pcie_p2p=3D1@ / 1e6 / durat=
ion_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average read bandwidth from PCIe devices un=
der this PCIe root complex to local PCIe peer addresses.",
> +        "PublicDescription": "Average read bandwidth of requests from al=
l PCIe devices under this PCIe root complex to local PCIe peer addresses.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_wr_bandwidth_to_local_pcie_peer",
> +        "MetricGroup": "PCIE_Bandwidth;PCIE_Write;PCIE_To_Local_PCIE_Pee=
r",
> +        "MetricExpr": "PCIE_WR_BYTES@dst_loc_pcie_p2p=3D1@ / 1e6 / durat=
ion_time",
> +        "ScaleUnit": "1MB/s",
> +        "BriefDescription": "Average write bandwidth from PCIe devices u=
nder this PCIe root complex to local PCIe peer addresses.",
> +        "PublicDescription": "Average write bandwidth of requests from a=
ll PCIe devices under this PCIe root complex to local PCIe peer addresses."=
,
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    },
> +    {
> +        "MetricName": "pcie_avg_rd_latency_to_local_pcie_peer",
> +        "MetricGroup": "PCIE_Read_Latency;PCIE_Read;PCIE_To_Local_PCIE_P=
eer",
> +        "MetricConstraint": "NO_GROUP_EVENTS",
> +        "MetricExpr": "(PCIE_RD_CUM_OUTS@dst_loc_pcie_p2p=3D1@ / PCIE_RD=
_REQ@dst_loc_pcie_p2p=3D1@) / pcie_freq",
> +        "ScaleUnit": "1ns/request",
> +        "BriefDescription": "Average read latency from PCIe devices unde=
r this PCIe root complex to local PCIe peer addresses.",
> +        "PublicDescription": "Average latency of read requests from all =
PCIe devices under this PCIe root complex to local PCIe peer addresses.",
> +        "Compat": "1030136b",
> +        "Unit": "nvidia_pcie_pmu_,rc_"
> +    }
> +]
> --
> 2.43.0
>
