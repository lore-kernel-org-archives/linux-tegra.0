From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/3] kernel: add calibration_delay_done()
Date: Tue, 20 May 2014 21:41:31 +0400
Message-ID: <537B93CB.3040109@cogentembedded.com>
References: <1400600176-435-1-git-send-email-pdeschrijver@nvidia.com> <1400600176-435-2-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1400600176-435-2-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 05/20/2014 07:36 PM, Peter De Schrijver wrote:

> Add calibration_delay_done() call and dummy implementation. This allows
> architectures to stop accepting registrations for new timer based delay
> functions.

> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>   init/calibrate.c |   12 ++++++++++++
>   1 files changed, 12 insertions(+), 0 deletions(-)

> diff --git a/init/calibrate.c b/init/calibrate.c
> index 520702d..31cae76 100644
> --- a/init/calibrate.c
> +++ b/init/calibrate.c
> @@ -262,6 +262,16 @@ unsigned long __attribute__((weak)) calibrate_delay_is_known(void)
>   	return 0;
>   }
>
> +/*
> + * Indicate the cpu delay calibration is done. This can be used by
> + * architectures to stop accepting delay timer registrations after this point.
> + */
> +
> +void __attribute__((weak)) calibration_delay_done(void)
> +{
> +	return;

    Not really needed.

> +}
> +
>   void calibrate_delay(void)
>   {
>   	unsigned long lpj;

WBR, Sergei
