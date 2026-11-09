Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243701;
	b=dFSroAHQ51yX7gsnwrJm8VoViEHkBWVAvsa4gkWZl87XKobBANw8CGl5ety8bdSXDrLJ
	 RGH+zQlvKAtEIw85ECTsi6+tyz8SKLO8MmvGwNKIDM/P6ROPl/bYfKt9PKgUlOWiq9KLC
	 9fvuOoaOkkpbHbmNIhjVKmEg0NyZBYEdL+kmfh2YR09pmbe7xwnEddhdiVcFcMaJwez63
	 2YZIF/hu7Pmb+9yXJ5dhHusixqI2VZ883lZ32ItGF/LFABGqwOTi6MMgHA2m8CJ+3/R5I
	 PZjSlB1rht7FiHdxZxGKjgbsi9czBKYKnLMIeewT/HpawAuf2hlvmKH6QNl2AhgmLkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243701;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1gM2/MVj9trudnYWa03wdj63INGyrk8iqN6swHva+AI=;
	b=ecwfcv93R0WlLCIHU35Rx3/h3zY2gmOzQSJ79ZEu51U8c0P+c8hqV2aTLGT/0UnjgiAV
	 5sni5RW4YumZGFOa+ApkytwGGwus87g1ghd+Zwrr9eRoct1mphSS2lDnF8QNMlhhvRl3L
	 uR1Ql3oHRkvrzxYDkujxOO7iq+qAr0kTLF6ZYjHY3akRPiJPfui1BfXK/s3eVWjj57WZR
	 NtRlzDSzpwhlsf7iSUMDbLRPG9c1Zk22+QjdBL1f27PaEmsWRHKg7a0lkzYA+Ovw5fkOr
	 YC7XU1pp8KddHrwLt/NH4DXLVkd9dOHa5TlmVlICc3bHOm5CQwS4uNw5zfmrBS7GJXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WtO8yXQJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8566606A33B
	for <linux-tegra@vger.kernel.org>; Mon,  9 Nov 2026 17:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WtO8yXQJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B55E1F00902
	for <linux-tegra@vger.kernel.org>; Mon,  9 Nov 2026 17:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243700;
	bh=1gM2/MVj9trudnYWa03wdj63INGyrk8iqN6swHva+AI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WtO8yXQJDT4U7vaz5ANfVjxw6XrEjWFu4KxoTQFyV0fIJ8Ne0rnGSTCfKujx5CEXH
	 9ApNXEMOOjxPRTSXU+Hrmop8OaIy8cbbuzM3+0l/BB7rQjvj2f26SpVGY8ZXvzP8vW
	 Afk8PysX7H58s7pVpKKtbxmBiadiBDfkcF+OFEWICB/HxItp7S+5HLVMYB6BN7enY4
	 0xKVpvdhyYdfzNIL5r22hykaLRxkr1+3zHAazj8D4MPBCyqJbChd7qCcT8y8DdPVKI
	 LBAkZOG+mcZY55bhH2Avx2d7SacCMFo9kmBCaW/BozHdD9o7TpkaiJE0cqMH0qgens
	 rgxdw9s8o7x3A==
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ec690faf85so357677e0c.0
        for <linux-tegra@vger.kernel.org>; Mon, 09 Nov 2026 09:01:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEhmZcW2fO4imc4wD+IhO0ig0EsZ9SSkPM04f0BPdNm5hkG7vPbkSpoVxKhv6HcZwLHHBbzrZ+9tX7H/w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9zsWiMaTFn6UksF6Riu9XW8uwnBVXbKPB8xN511LYl+vD7iHgS
	mogn2COX1gfjnzMx74hOQhZRsGjsr4Oioaa2iOqP86noLlTYHX6xsZ0pX/Q67w8suM8GRTOYVgz
	rLc29swqIBfuTD4f3yeP/7vGr+9MaOE4=
X-Received: by 2002:a05:6122:ca3:b0:5ec:e7e:27d6 with SMTP id
 71dfb90a1353d-5ece7220f04mr1598066e0c.4.1794243699669; Mon, 09 Nov 2026
 09:01:39 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106193304.3347374-1-sumitg@nvidia.com> <20261106193304.3347374-7-sumitg@nvidia.com>
In-Reply-To: <20261106193304.3347374-7-sumitg@nvidia.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 9 Nov 2026 18:01:23 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h=iH01rZeXARa3F3rE61qgp0K6U4Fm9wRp+LYq_zD94w@mail.gmail.com>
X-Gm-Features: AclHuK-xa6NrcFo2Dv_7tc_LebfrddhnYOlISF0ryWxq0k0dpj4KodkkFKgCob8
Message-ID: <CAJZ5v0h=iH01rZeXARa3F3rE61qgp0K6U4Fm9wRp+LYq_zD94w@mail.gmail.com>
Subject: Re: [PATCH v9 6/8] ACPI: CPPC: Add ospm_nominal_perf support
To: Sumit Gupta <sumitg@nvidia.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, pierre.gondois@arm.com, 
	christian.loehle@arm.com, ionela.voinescu@arm.com, zhenglifeng1@huawei.com, 
	zhanjie9@hisilicon.com, lenb@kernel.org, ray.huang@amd.com, 
	mario.limonciello@amd.com, perry.yuan@amd.com, kprateek.nayak@amd.com, 
	maciej.wieczor-retman@intel.com, pawel.chmielewski@intel.com, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com, 
	vsethi@nvidia.com, ksitaraman@nvidia.com, sanjayc@nvidia.com, 
	mochs@nvidia.com, bbasu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 8:35=E2=80=AFPM Sumit Gupta <sumitg@nvidia.com> wrot=
e:
>
> Expose the OSPM Nominal Performance register (ACPI 6.6, Section
> 8.4.6.1.2.6), which conveys the nominal performance level at which the
> platform may run. Unlike the read-only Nominal Performance register, it
> is writable, so OSPM can ask for a nominal level below the
> platform-reported one, which then becomes the boundary between boosted
> and throttled operation.
>
> Add cppc_set_ospm_nominal_perf() to write the register. Per the spec,
> the value must lie in [Lowest Performance, Nominal Performance], which
> the caller is responsible for validating.
>
> Add cppc_ospm_nominal_perf_supported() to report whether the platform
> implements the register as writable, since a write-only register cannot
> be probed by reading it. It uses the same cpc_is_writable() test as the
> setter, so support is never reported for a register that a write would
> reject, and takes cpc_desc_lock while looking the descriptor up.
>
> The register also joins the writable set that the SystemMemory overlap
> validation uses, as the driver now writes it and can compete with
> another control sharing an access unit.
>
> Reviewed-by: Christian Loehle <christian.loehle@arm.com>
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>  drivers/acpi/cppc_acpi.c | 44 ++++++++++++++++++++++++++++++++++++++++
>  include/acpi/cppc_acpi.h | 10 +++++++++
>  2 files changed, 54 insertions(+)
>
> diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
> index 5a1f84fddb7f..3a0ecdd1ab11 100644
> --- a/drivers/acpi/cppc_acpi.c
> +++ b/drivers/acpi/cppc_acpi.c
> @@ -463,6 +463,7 @@ static bool cpc_reg_is_writable(unsigned int reg_idx)
>         case AUTO_SEL_ENABLE:
>         case AUTO_ACT_WINDOW:
>         case ENERGY_PERF:
> +       case OSPM_NOMINAL_PERF:

Sashiko is unhappy about this change:

https://sashiko.dev/#/patchset/20261106193304.3347374-1-sumitg%40nvidia.com

>                 return true;
>         default:
>                 return false;
> @@ -3232,6 +3233,49 @@ int cppc_set_epp(int cpu, u64 epp_val)
>  }
>  EXPORT_SYMBOL_GPL(cppc_set_epp);
>
> +/**
> + * cppc_set_ospm_nominal_perf() - Write OSPM Nominal Performance registe=
r.
> + * @cpu: CPU on which to write register.
> + * @ospm_nominal_perf: Value to write to the OSPM Nominal Performance re=
gister.
> + *
> + * OSPM Nominal Performance conveys the desired nominal performance leve=
l
> + * at which the platform may run. Per ACPI 6.6, s8.4.6.1.2.6, the value
> + * must lie within [Lowest Performance, Nominal Performance] and may be
> + * set independently of Minimum, Maximum and Desired performance. The
> + * caller is responsible for validating the range.
> + *
> + * Return: 0 on success, -EOPNOTSUPP if the platform does not implement =
the
> + * register as writable, or another negative error code.
> + */
> +int cppc_set_ospm_nominal_perf(int cpu, u64 ospm_nominal_perf)
> +{
> +       return cppc_set_reg_val(cpu, OSPM_NOMINAL_PERF, ospm_nominal_perf=
);
> +}
> +EXPORT_SYMBOL_GPL(cppc_set_ospm_nominal_perf);
> +
> +/**
> + * cppc_ospm_nominal_perf_supported() - Check OSPM Nominal Performance s=
upport.
> + * @cpu: CPU to query.
> + *
> + * The OSPM Nominal Performance register is write-only, so its value
> + * cannot be read back. This only reports whether the platform implement=
s
> + * it as a writable register.
> + *
> + * Context: Process context.
> + * Return: true if the register is supported, false otherwise.
> + */
> +bool cppc_ospm_nominal_perf_supported(int cpu)
> +{
> +       struct cpc_desc *cpc_desc;
> +
> +       guard(mutex)(&cpc_desc_lock);
> +       cpc_desc =3D per_cpu(cpc_desc_ptr, cpu);
> +
> +       return cpc_desc &&
> +              cpc_is_writable(&cpc_desc->cpc_regs[OSPM_NOMINAL_PERF]);
> +}
> +EXPORT_SYMBOL_GPL(cppc_ospm_nominal_perf_supported);
> +
>  /**
>   * cppc_get_auto_act_window() - Read autonomous activity window register=
.
>   * @cpu: CPU from which to read register.
> diff --git a/include/acpi/cppc_acpi.h b/include/acpi/cppc_acpi.h
> index a5545fd3f8bd..2cec54b4d2e2 100644
> --- a/include/acpi/cppc_acpi.h
> +++ b/include/acpi/cppc_acpi.h
> @@ -195,6 +195,8 @@ extern int cpc_write_ffh(int cpunum, struct cpc_reg *=
reg, u64 val);
>  extern int cppc_get_epp_perf(int cpunum, u64 *epp_perf);
>  extern int cppc_set_epp_perf(int cpu, struct cppc_perf_ctrls *perf_ctrls=
, bool enable);
>  extern int cppc_set_epp(int cpu, u64 epp_val);
> +extern int cppc_set_ospm_nominal_perf(int cpu, u64 ospm_nominal_perf);
> +extern bool cppc_ospm_nominal_perf_supported(int cpu);
>  extern int cppc_get_auto_act_window(int cpu, u64 *auto_act_window);
>  extern int cppc_set_auto_act_window(int cpu, u64 auto_act_window);
>  extern int cppc_get_auto_sel(int cpu, u64 *enable);
> @@ -290,6 +292,14 @@ static inline int cppc_set_epp(int cpu, u64 epp_val)
>  {
>         return -EOPNOTSUPP;
>  }
> +static inline int cppc_set_ospm_nominal_perf(int cpu, u64 ospm_nominal_p=
erf)
> +{
> +       return -EOPNOTSUPP;
> +}
> +static inline bool cppc_ospm_nominal_perf_supported(int cpu)
> +{
> +       return false;
> +}
>  static inline int cppc_get_auto_act_window(int cpu, u64 *auto_act_window=
)
>  {
>         return -EOPNOTSUPP;
> --
> 2.34.1
>
