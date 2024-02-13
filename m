Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5FD4D9F1
	for <linux-tegra@vger.kernel.org>; Tue, 13 Feb 2024 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707827639; cv=none; b=dU3NvH3vXHkXj0/2Kpoc2jHIj9F40B0l+vU1KCEmXp9lgvLhIKw9NnQhjWR2XyqDK1cw7+W9/8fY4cCL6tZnVRGIvGzoyHwefHITPsWJZyLgwygD0/aG0rYggTBLgu4e86SpolIVhzVZcUp3QtndZUZjVxwo2YZ3124PwrTHPOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707827639; c=relaxed/simple;
	bh=aM4bIl9eWKjV3yDMzVMnnvyt3XnsotON19iQ0XJi1q8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+BL+uejmoT8ICq5z8lv0dEweV1qqAaaw3VNRSPHEb4gS2EGHXMA1Tf7qWO2GHiy0ZW+/mxHnfxS/yrfhbeja8wNe+Lb/DqQKKm5lsEpSuHeSMPIHyRWTz7NmTXqmUi9DlyjiQD3hRc/LlBe3WXe2ZNIQdjp/VJbIkCW91tOd1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nxf4nv38; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nxf4nv38"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso1443048276.2
        for <linux-tegra@vger.kernel.org>; Tue, 13 Feb 2024 04:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707827637; x=1708432437; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tu7SNQnx0i2xazLUM+3IUH69yXJUiUg7fnfrZ1sLaQc=;
        b=Nxf4nv38G3+mx64mQ1Bo6ijIzLNOS3uh+uoxKfO9Br4nlB3m4MGQ146BKx6VyAAhq3
         4kjsGdyFnNMT0/NuGFaLV1GQjSdOGH8cJLxSHdiHzDPFKDshgk7JrEqzf2J8MZkYz4ZM
         nmwNrIKtsq+J1pp0vHZmx2UA3tVf3oy/4oABkdX7tBC3gUewap8AB+dvLjk7Jucinq2/
         RKsKsLoLseOu5IHyg74qSjAwiekJ++/SxeK36aPgo8m4TYtAkWDES2K2AgSUD46SDiZM
         acddZpBIJW17A3Q9MGuad9W1dfguYrSptWm+WsQ5SWpRmaeWnfrvflyXBauk1/Tq+W6z
         Y2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707827637; x=1708432437;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tu7SNQnx0i2xazLUM+3IUH69yXJUiUg7fnfrZ1sLaQc=;
        b=MZA0tW1EHDw+OtMh2RjDD6xhgZ4VVpEg449vWSrSZyRn8oNGU+UVN0WwXYrNJI9y81
         pAUCZBSAqHnxGUyShQXVcaAHTLvSAsSBjuWl3/V8NsRweJNTESMgACFCiGaRix2GcUiv
         Mn3TarWVoV+jBoNeNii+xPIZ1krwq19UrG2DrCypHGEAHh0/CNmFLjJSigpMXUUT5K5i
         aw6QFSDWQjvyMldye9nKm5axmLEE8OcD2apxH6Ru2MLSK7AYgjnJSeDlMUJg/m7SlztR
         tNGpj7iiSxdM2j0835fF3DlQmW9XuUpYpjxOdmigIJa0/sbk2Xp1Cj2NdeRlwbumUjJw
         OOFg==
X-Forwarded-Encrypted: i=1; AJvYcCX0qCF4qkVnE1sD8CRhpXpMUWeaaO8t1LdDPXBSL22fEOMiAmK46uKSltR51qrZaH5mD6to4LyAq8FBK0RjCPUK3FUNrqzmExmMrkI=
X-Gm-Message-State: AOJu0YzRT7bv3Fpr8GMiEhyhVg5MgYQJ1eeOp5zJTELDs1mOxW+sPxtv
	kODnj5Y18EwA+iVZcMb4HGJ2qDw/JYfwDc1NsVggZlm/zRxe2k6piyprQQfUi8mW/xRq2FGaLMX
	OmvD0zZ31dsmN+/Xwt2dVZ4w+ehzQYM2bYU3xSw==
X-Google-Smtp-Source: AGHT+IEGOEobuHtzZk9d51dS2TbILWN3Fo1EkXlSUML6sBQOl574XzjSdCTa5r7ZJQ6v2wQ2sMfTYfgHCvBOMKFTlOU=
X-Received: by 2002:a25:d686:0:b0:dcd:905:3d17 with SMTP id
 n128-20020a25d686000000b00dcd09053d17mr707344ybg.32.1707827637070; Tue, 13
 Feb 2024 04:33:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208202822.631449-1-krzysztof.kozlowski@linaro.org> <20240208202822.631449-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240208202822.631449-2-krzysztof.kozlowski@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 13 Feb 2024 13:33:21 +0100
Message-ID: <CAPDyKFpAnrhVWnt-qy3ysT1EGgEB7h6UvoSa6w=faQXqyk+nsA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pmdomain: constify of_phandle_args in add device and subdomain
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Feb 2024 at 21:28, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Pointer to of_phandle_args is not modified by of_genpd_add_device() and
> of_genpd_add_subdomain(), so it can be made pointer to const for code
> safety and readability.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/core.c   | 12 ++++++------
>  include/linux/pm_domain.h | 20 ++++++++++----------
>  2 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index ea4b29475206..4215ffd9b11c 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2526,7 +2526,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>   * on failure.
>   */
>  static struct generic_pm_domain *genpd_get_from_provider(
> -                                       struct of_phandle_args *genpdspec)
> +                                       const struct of_phandle_args *genpdspec)
>  {
>         struct generic_pm_domain *genpd = ERR_PTR(-ENOENT);
>         struct of_genpd_provider *provider;
> @@ -2557,7 +2557,7 @@ static struct generic_pm_domain *genpd_get_from_provider(
>   * Looks-up an I/O PM domain based upon phandle args provided and adds
>   * the device to the PM domain. Returns a negative error code on failure.
>   */
> -int of_genpd_add_device(struct of_phandle_args *genpdspec, struct device *dev)
> +int of_genpd_add_device(const struct of_phandle_args *genpdspec, struct device *dev)
>  {
>         struct generic_pm_domain *genpd;
>         int ret;
> @@ -2591,8 +2591,8 @@ EXPORT_SYMBOL_GPL(of_genpd_add_device);
>   * provided and adds the subdomain to the parent PM domain. Returns a
>   * negative error code on failure.
>   */
> -int of_genpd_add_subdomain(struct of_phandle_args *parent_spec,
> -                          struct of_phandle_args *subdomain_spec)
> +int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
> +                          const struct of_phandle_args *subdomain_spec)
>  {
>         struct generic_pm_domain *parent, *subdomain;
>         int ret;
> @@ -2629,8 +2629,8 @@ EXPORT_SYMBOL_GPL(of_genpd_add_subdomain);
>   * provided and removes the subdomain from the parent PM domain. Returns a
>   * negative error code on failure.
>   */
> -int of_genpd_remove_subdomain(struct of_phandle_args *parent_spec,
> -                             struct of_phandle_args *subdomain_spec)
> +int of_genpd_remove_subdomain(const struct of_phandle_args *parent_spec,
> +                             const struct of_phandle_args *subdomain_spec)
>  {
>         struct generic_pm_domain *parent, *subdomain;
>         int ret;
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 1a391ef1b6f8..772d3280d35f 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -364,11 +364,11 @@ int of_genpd_add_provider_simple(struct device_node *np,
>  int of_genpd_add_provider_onecell(struct device_node *np,
>                                   struct genpd_onecell_data *data);
>  void of_genpd_del_provider(struct device_node *np);
> -int of_genpd_add_device(struct of_phandle_args *args, struct device *dev);
> -int of_genpd_add_subdomain(struct of_phandle_args *parent_spec,
> -                          struct of_phandle_args *subdomain_spec);
> -int of_genpd_remove_subdomain(struct of_phandle_args *parent_spec,
> -                             struct of_phandle_args *subdomain_spec);
> +int of_genpd_add_device(const struct of_phandle_args *args, struct device *dev);
> +int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
> +                          const struct of_phandle_args *subdomain_spec);
> +int of_genpd_remove_subdomain(const struct of_phandle_args *parent_spec,
> +                             const struct of_phandle_args *subdomain_spec);
>  struct generic_pm_domain *of_genpd_remove_last(struct device_node *np);
>  int of_genpd_parse_idle_states(struct device_node *dn,
>                                struct genpd_power_state **states, int *n);
> @@ -393,20 +393,20 @@ static inline int of_genpd_add_provider_onecell(struct device_node *np,
>
>  static inline void of_genpd_del_provider(struct device_node *np) {}
>
> -static inline int of_genpd_add_device(struct of_phandle_args *args,
> +static inline int of_genpd_add_device(const struct of_phandle_args *args,
>                                       struct device *dev)
>  {
>         return -ENODEV;
>  }
>
> -static inline int of_genpd_add_subdomain(struct of_phandle_args *parent_spec,
> -                                        struct of_phandle_args *subdomain_spec)
> +static inline int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
> +                                        const struct of_phandle_args *subdomain_spec)
>  {
>         return -ENODEV;
>  }
>
> -static inline int of_genpd_remove_subdomain(struct of_phandle_args *parent_spec,
> -                                       struct of_phandle_args *subdomain_spec)
> +static inline int of_genpd_remove_subdomain(const struct of_phandle_args *parent_spec,
> +                                           const struct of_phandle_args *subdomain_spec)
>  {
>         return -ENODEV;
>  }
> --
> 2.34.1
>
