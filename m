Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9CB2F99A5
	for <linux-tegra@vger.kernel.org>; Fri, 24 Oct 2025 08:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292863; cv=none; b=FZo6vFym122atfhT6L4IhdrsMa1loqCI5D9Qqe6gEanlErnB4Mng+9ki04u0TCjXqrRQ2bB+Og2SsaFgq2sNgJgLkM7pysNt5bE4Ijo+tpHbPzh46Ii11jZsFmOg7VPqWBkCBG2FEdd4pdEpjPC8bIFaJDqb71vmKoeyNn9Lkdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292863; c=relaxed/simple;
	bh=cVdGk421Yf5RFe9fH7sOkQsULYde7RppGYKbXWzQHtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nWrNfMpUsbw7SDE8piKW7p/zA3KBhgrqEA92X0BjE/t1UYZQaJ/+mcKOM0QEGpE54/4Y2X+Zi0i+KBjv2HIcYnveL0j2E6Im6FdWA0CL2HpuTOAs/ZXQj8nhpRjo3tzOZfI+Xx/VFYrN/DwliefR2ny4gsmYaC3JMSGXO5Ite2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k23FOasF; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k23FOasF"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-592ee9a16adso2877534e87.0
        for <linux-tegra@vger.kernel.org>; Fri, 24 Oct 2025 01:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761292859; x=1761897659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SN0QFqF27xT4ns3n2W4FJ/2iJtx5o8GT+ucPbu577ZQ=;
        b=k23FOasF3T0ymdd7CHk04VQOlBv8a/JSCsbDuyoOJLlcrW6yyqLwrR2xebn4Ofm2gX
         SASqLVeowL02/0fn5CI87DQBhSpVMD0cfHgLQj69uFg5yIO6t2GgZ9XMIvfqZnxj6Vld
         CcvJJMDMhIUW+GUdOASzCfx+mXuiASdLBnAsrg070yy2ADRgFLI8XGKFzxc/1asYfdkM
         gCTrbN+ohQ5m1BfKkuoGo5tkc4enVmkbExqimkvyQONziOEodadOG3w0gQmkdRbql7nq
         HklLz5+QCRzxNpnblfK9kGzGTPs2Sus73A3UII7PrgOtLfggGC4JcZ5TQ1Lxw7rkwVb1
         r73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761292859; x=1761897659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SN0QFqF27xT4ns3n2W4FJ/2iJtx5o8GT+ucPbu577ZQ=;
        b=NMjVAQvLNUFloJ6zXZCEiDvodBkoe0ACsb+YfF0sf5PLyjAIJuQSO+owadb/jGhcVK
         xy9WRnvpewF4MDopfSi2vhLZR3yEtZfE4ge1LaesM/pknN87PT4vw0p/zlY8a6Wl5odV
         b3eJBXUX6Nj+yKqfYAvn4qgFsL9e59g9BZ318JqLd4tdigaC0/wgOFv+MznYY6BwrsvP
         OC/99/dGPxEytXyb64ism6bxQWQOi6ZwFsT5/MgZIV/RWv7lbJ3bejHL1CSj7+C4CV13
         WTtCFtTSEqeoTyaTmDgFuEVHAfJ64HlcCoA1DWYOgzRjGV1tJsYXSPtje6JNC7dO4Vei
         P6RA==
X-Gm-Message-State: AOJu0YxL8PmpTNNmoLsoUX1F1Rz2Q5CSOsDuDL6uTu5DO+usZwOEL8Gt
	W3Mwl5xQsRy96D89MEuCgMX70gr1l3g5vO71YbE+YKqk92qRvIG7i6/43biRDszD5Wtn7D3uMPe
	/XgwvvlvYv+YQqz/ozNyY7xWbRQRSCCBhSdCu
X-Gm-Gg: ASbGnctJZhAG2Slmey8euK+uBjPP71Rm33jPC4icYSnYpUNDpypkcByOUBQ0HePy2rX
	7UWExk8+Zs1tE0VPAjTZLM9ZDpdb0fdxzFfGVwlNAN20ho6vqKZj9rFqBCNZ27/7wgrG4+30dAN
	ak1YKEyFVFll3maeMck+zWbEt/5SrMkVVZabey+X6VscIm+Vd4z7Rmt6ShgibkfnITh5Qhwlcuz
	w/PKMTvsXWJ5W2WZ6yR6C1iGEHiwavglQb4B8hF9GES11iXv++ALgcrj4JjHV+sAfORmYmTXLgt
	DOuZZA==
X-Google-Smtp-Source: AGHT+IFv3XIE5kQ+U86k41c0Hf5X3MvCrw3N0d3t/eVbiTwziWROCiPAn7mobz+4slBfolO2oPv9Y+rdAsxhkNUttx4=
X-Received: by 2002:a05:6512:10d4:b0:592:f73f:1226 with SMTP id
 2adb3069b0e04-592f73f141dmr1453914e87.22.1761292858330; Fri, 24 Oct 2025
 01:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aPsafpMKVTxj20zL@stanley.mountain>
In-Reply-To: <aPsafpMKVTxj20zL@stanley.mountain>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 24 Oct 2025 03:00:47 -0500
X-Gm-Features: AS18NWCNvUwIJVrfyBfRxafGN95_hWE24yypXZMww66whdSRdfjiOlhJhaMQs2o
Message-ID: <CALHNRZ8XnH64GCSFk21D7HPnbJ0Avr0Ds1SAPTPksohqd4dhjA@mail.gmail.com>
Subject: Re: [bug report] cpufreq: tegra186: add OPP support and set bandwidth
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 1:19=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hello Aaron Kling,
>
> Commit 71c46a6457e0 ("cpufreq: tegra186: add OPP support and set
> bandwidth") from Oct 21, 2025 (linux-next), leads to the following
> Smatch static checker warning:
>
>         drivers/cpufreq/tegra186-cpufreq.c:197 tegra186_cpufreq_init()
>         error: uninitialized symbol 'freq_table'.
>
> drivers/cpufreq/tegra186-cpufreq.c
>     174 static int tegra186_cpufreq_init(struct cpufreq_policy *policy)
>     175 {
>     176         struct tegra186_cpufreq_data *data =3D cpufreq_get_driver=
_data();
>     177         unsigned int cluster =3D data->cpus[policy->cpu].bpmp_clu=
ster_id;
>     178         struct cpufreq_frequency_table *freq_table;
>     179         struct cpufreq_frequency_table *bpmp_lut;
>     180         u32 cpu;
>     181         int ret;
>     182
>     183         policy->cpuinfo.transition_latency =3D 300 * 1000;
>     184         policy->driver_data =3D NULL;
>     185
>     186         /* set same policy for all cpus in a cluster */
>     187         for (cpu =3D 0; cpu < ARRAY_SIZE(tegra186_cpus); cpu++) {
>     188                 if (data->cpus[cpu].bpmp_cluster_id =3D=3D cluste=
r)
>     189                         cpumask_set_cpu(cpu, policy->cpus);
>     190         }
>     191
>     192         bpmp_lut =3D data->clusters[cluster].bpmp_lut;
>     193
>     194         if (data->icc_dram_bw_scaling) {
>     195                 ret =3D tegra_cpufreq_init_cpufreq_table(policy, =
bpmp_lut, &freq_table);
>     196                 if (!ret) {
> --> 197                         policy->freq_table =3D freq_table;
>
> tegra_cpufreq_init_cpufreq_table() will return zero if there are no
> available opps.  The freq_table will be uninitialized in that case.
> It's this path:
>
>           122          max_opps =3D dev_pm_opp_get_opp_count(cpu_dev);
>           123          if (max_opps <=3D 0) {
>           124                  dev_err(cpu_dev, "Failed to add OPPs\n");
>           125                  return max_opps;
>           126          }
>
>     198                         return 0;
>     199                 }
>     200         }
>     201
>     202         data->icc_dram_bw_scaling =3D false;
>     203         policy->freq_table =3D bpmp_lut;
>     204         pr_info("OPP tables missing from DT, EMC frequency scalin=
g disabled\n");
>     205
>     206         return 0;
>     207 }
>
> regards,
> dan carpenter

I'm looking at dev_pm_opp_of_add_table_indexed which gets called
before dev_pm_opp_get_opp_count inside
tegra_cpufreq_init_cpufreq_table(). It states that it will return
-ENODATA if the opp table is empty, which would then return a negative
value from tegra_cpufreq_init_cpufreq_table(), which gets handled as
expected. Is there a way for opp count to be zero that would get past
this? The code could be better, but I'm not sure there's an operable
fail case here.

Also of note, the same effective flow exists in the tegra194 cpufreq
driver, so if something does need to be fixed here, it should probably
be applied there at the same time.

Sincerely,
Aaron
