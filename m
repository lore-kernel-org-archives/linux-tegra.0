From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] cpuidle: change enter_s2idle() prototype
Date: Mon, 29 Jun 2020 17:17:28 +0200
Message-ID: <9963896.lEaLCsxmBZ@kreacher>
References: <1593421540-7397-1-git-send-email-neal.liu@mediatek.com> <1593421540-7397-2-git-send-email-neal.liu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1593421540-7397-2-git-send-email-neal.liu@mediatek.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Neal Liu <neal.liu@mediatek.com>
Cc: Len Brown <lenb@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sami Tolvanen <samitolvanen@google.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
List-Id: linux-tegra@vger.kernel.org

On Monday, June 29, 2020 11:05:40 AM CEST Neal Liu wrote:
> Control Flow Integrity(CFI) is a security mechanism that disallows
> changes to the original control flow graph of a compiled binary,
> making it significantly harder to perform such attacks.
> 
> init_state_node() assigns same function pointer to idle_state->enter
> and idle_state->enter_s2idle. This definitely causes CFI failure
> when calling either enter() or enter_s2idle().
> 
> Align enter_s2idle() with enter() function prototype to fix CFI
> failure.

That needs to be documented somewhere close to the definition of the
callbacks in question.

Otherwise it is completely unclear why this is a good idea.

> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> ---
>  drivers/acpi/processor_idle.c   |    6 ++++--
>  drivers/cpuidle/cpuidle-tegra.c |    8 +++++---
>  drivers/idle/intel_idle.c       |    6 ++++--
>  include/linux/cpuidle.h         |    6 +++---
>  4 files changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
> index 75534c5..6ffb6c9 100644
> --- a/drivers/acpi/processor_idle.c
> +++ b/drivers/acpi/processor_idle.c
> @@ -655,8 +655,8 @@ static int acpi_idle_enter(struct cpuidle_device *dev,
>  	return index;
>  }
>  
> -static void acpi_idle_enter_s2idle(struct cpuidle_device *dev,
> -				   struct cpuidle_driver *drv, int index)
> +static int acpi_idle_enter_s2idle(struct cpuidle_device *dev,
> +				  struct cpuidle_driver *drv, int index)
>  {
>  	struct acpi_processor_cx *cx = per_cpu(acpi_cstate[index], dev->cpu);
>  
> @@ -674,6 +674,8 @@ static void acpi_idle_enter_s2idle(struct cpuidle_device *dev,
>  		}
>  	}
>  	acpi_idle_do_entry(cx);
> +
> +	return 0;
>  }
>  
>  static int acpi_processor_setup_cpuidle_cx(struct acpi_processor *pr,
> diff --git a/drivers/cpuidle/cpuidle-tegra.c b/drivers/cpuidle/cpuidle-tegra.c
> index 1500458..a12fb14 100644
> --- a/drivers/cpuidle/cpuidle-tegra.c
> +++ b/drivers/cpuidle/cpuidle-tegra.c
> @@ -253,11 +253,13 @@ static int tegra_cpuidle_enter(struct cpuidle_device *dev,
>  	return err ? -1 : index;
>  }
>  
> -static void tegra114_enter_s2idle(struct cpuidle_device *dev,
> -				  struct cpuidle_driver *drv,
> -				  int index)
> +static int tegra114_enter_s2idle(struct cpuidle_device *dev,
> +				 struct cpuidle_driver *drv,
> +				 int index)
>  {
>  	tegra_cpuidle_enter(dev, drv, index);
> +
> +	return 0;
>  }
>  
>  /*
> diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
> index f449584..b178da3 100644
> --- a/drivers/idle/intel_idle.c
> +++ b/drivers/idle/intel_idle.c
> @@ -175,13 +175,15 @@ static __cpuidle int intel_idle(struct cpuidle_device *dev,
>   * Invoked as a suspend-to-idle callback routine with frozen user space, frozen
>   * scheduler tick and suspended scheduler clock on the target CPU.
>   */
> -static __cpuidle void intel_idle_s2idle(struct cpuidle_device *dev,
> -					struct cpuidle_driver *drv, int index)
> +static __cpuidle int intel_idle_s2idle(struct cpuidle_device *dev,
> +				       struct cpuidle_driver *drv, int index)
>  {
>  	unsigned long eax = flg2MWAIT(drv->states[index].flags);
>  	unsigned long ecx = 1; /* break on interrupt flag */
>  
>  	mwait_idle_with_hints(eax, ecx);
> +
> +	return 0;
>  }
>  
>  /*
> diff --git a/include/linux/cpuidle.h b/include/linux/cpuidle.h
> index ec2ef63..bee10c0 100644
> --- a/include/linux/cpuidle.h
> +++ b/include/linux/cpuidle.h
> @@ -66,9 +66,9 @@ struct cpuidle_state {
>  	 * suspended, so it must not re-enable interrupts at any point (even
>  	 * temporarily) or attempt to change states of clock event devices.
>  	 */
> -	void (*enter_s2idle) (struct cpuidle_device *dev,
> -			      struct cpuidle_driver *drv,
> -			      int index);
> +	int (*enter_s2idle)(struct cpuidle_device *dev,
> +			    struct cpuidle_driver *drv,
> +			    int index);
>  };
>  
>  /* Idle State Flags */
> -- 
> 1.7.9.5
> 
