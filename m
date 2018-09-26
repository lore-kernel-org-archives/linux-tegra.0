From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 1/5] PM / Domains: Export symbol for genpd_dev_pm_attach_by_name
Date: Wed, 26 Sep 2018 16:09:47 +0200
Message-ID: <CAPDyKFrtw1aYg5QbgRi_jp-xd0VLNeRYhb4HvX4P3AfGjgO0VA@mail.gmail.com>
References: <1537964858-30332-1-git-send-email-jonathanh@nvidia.com> <1537964858-30332-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1537964858-30332-2-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Thierry Reding <thierry.reding@gmail.com>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 26 September 2018 at 14:27, Jon Hunter <jonathanh@nvidia.com> wrote:
> Export the symbol for genpd_dev_pm_attach_by_name() so that drivers
> built as modules can call this function.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/base/power/domain.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index 4b5714199490..b2bbe0d848d2 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -2397,6 +2397,7 @@ struct device *genpd_dev_pm_attach_by_name(struct device *dev, char *name)
>
>         return genpd_dev_pm_attach_by_id(dev, index);
>  }
> +EXPORT_SYMBOL_GPL(genpd_dev_pm_attach_by_name);

Driver's shouldn't be calling this function, but instead use
dev_pm_domain_attach_by_name().

Is there any problem with that?

[...]

Kind regards
Uffe
