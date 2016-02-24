From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] regulator: core: fix error path of
 regulator_ena_gpio_free
Date: Wed, 24 Feb 2016 09:18:27 +0000
Message-ID: <56CD7563.2060702@nvidia.com>
References: <56CC7863.4080202@nvidia.com>
 <1456302479-14045-1-git-send-email-krzysztof.adamski@tieto.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456302479-14045-1-git-send-email-krzysztof.adamski@tieto.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Adamski <krzysztof.adamski@tieto.com>, Mark Brown <broonie@kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


On 24/02/16 08:27, Krzysztof Adamski wrote:
> This problem was introduced by:
> commit daad134d6649 ("regulator: core: Request GPIO before creating
> sysfs entries")

I think you need to be more specific about what the "problem" is. The
subject does not really explain it either. I would suggest you change
the subject to "fix crash in error path of regulator_register()" as
it is not really regulator_ena_gpio_free() that is a problem.

I would like to point out that this problem breaks the boot on all 
Tegra 32-bit devices because it is quite common for the regulator
registration to be deferred on boot and this will trigger a crash.
So it is very common and I am not sure what other platforms are
impacted by this. Therefore, it would be good to get this fixed soon.

Mark mentioned included a boot log of the crash. Here is one from
Tegra124-TK1, but unfortunately, it is not too useful, although the
crash does happen right after the regulator registration deferral.
Nonetheless I have bisected the kernel and found the commit that was
responsible and verified that reverting it fixes the crash.


[    0.505924] +USB0_VBUS_SW: Failed to request enable GPIO108: -517
[    0.510196] Unable to handle kernel NULL pointer dereference at virtual address 00000044
[    0.518360] pgd = c0004000
[    0.521108] [00000044] *pgd=00000000
[    0.524752] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[    0.530121] Modules linked in:
[    0.533247] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.5.0-rc5-next-20160224-75670-g96aa086 #1
[    0.541995] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    0.548322] task: ee85b380 ti: ee85c000 task.ti: ee85c000
[    0.553786] PC is at kernfs_find_ns+0x8/0xf4
[    0.558117] LR is at kernfs_find_and_get_ns+0x30/0x48
[    0.563232] pc : [<c024afe8>]    lr : [<c024b1a4>]    psr: 60000013
[    0.563232] sp : ee85dd4c  ip : 00000001  fp : c0c1857c
[    0.574842] r10: eefeca70  r9 : c0b3b83c  r8 : ee9cdc60
[    0.580129] r7 : c0857730  r6 : 00000000  r5 : 00000000  r4 : c0c10718
[    0.586715] r3 : ee85b380  r2 : 00000000  r1 : c0857730  r0 : 00000000
[    0.593304] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    0.600496] Control: 10c5387d  Table: 8000406a  DAC: 00000051
[    0.606302] Process swapper/0 (pid: 1, stack limit = 0xee85c210)
[    0.612369] Stack: (0xee85dd4c to 0xee85e000)
[    0.616792] dd40:                            c0c10718 00000000 00000000 c0857730 c024b1a4
[    0.625027] dd60: 00000000 c0c2654c ee9cdc68 ee9cdc60 ee9926d0 c024df1c 00000000 c0c26510
[    0.633260] dd80: ee9cdc68 c0439938 ee9cdc60 ee9cdc60 00000000 c042f9d0 00000000 c01a927c
[    0.641493] dda0: 00000008 ee9926d0 ee9c9490 ee9cdc60 fffffdfb c0c18730 ee9926d0 c042fb80
[    0.649727] ddc0: ee99dc10 c03abe90 00000002 ee9a0210 ee9ccb50 ee800000 c03add80 ee9c9bc0
[    0.657960] dde0: ee9cdc60 00000001 eefeca70 c01eb2f8 ee85de34 ee85de34 ee9c9410 ee9a0210
[    0.666193] de00: ee99dc10 ee9a0200 c0b3b83c eefeca70 00000000 c03add98 ee9ccb50 ee9c94d0
[    0.674426] de20: ee99dc10 00000000 ee9a0210 c03aebb4 00000000 ee9a0210 ee9ccb50 ee99dc10
[    0.682660] de40: eefeca70 00000000 00000001 0000006c 00000000 00000008 ee9a0210 fffffffe
[    0.690893] de60: ee9a0210 fffffdfb c0c188b8 c0c188b8 00000000 c0434080 c0434030 ee9a0210
[    0.699126] de80: c0caa264 c0caa26c 00000000 c0432aac 00000000 ee9a0210 c0c188b8 ee9a0244
[    0.707360] dea0: 00000000 c0b1bc2c 00000000 c0432c14 00000000 c0c188b8 c0432b68 c04310d0
[    0.715593] dec0: ee81a55c ee997b34 c0c188b8 ee9c6700 c0c25f68 c04320a0 c09cc320 c0c188b8
[    0.723826] dee0: c0c065c8 c0c188b8 c0c065c8 ee9bbdc0 c0c60000 c0433410 c0433d14 c0c065c8
[    0.732059] df00: c0c065c8 c0101768 c0802898 00000014 00000000 00000000 c0c0c400 c0c0c488
[    0.740293] df20: 00000000 c0c0a998 efffcc66 c0820554 00000101 c01378d4 00000000 c099ce50
[    0.748526] df40: c0a70794 00000000 00000004 00000004 c0c0a960 efffcc00 c0b4f748 00000004
[    0.756760] df60: c0b3b828 c0c60000 00000101 c0b3b83c c0b00598 c0b00dd8 00000004 00000004
[    0.764993] df80: 00000000 c0b00598 00000000 c07d4ec8 00000000 00000000 00000000 00000000
[    0.773226] dfa0: 00000000 c07d4ed0 00000000 c0107938 00000000 00000000 00000000 00000000
[    0.781459] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    0.789693] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 dfffffff ffffbfff
[    0.797933] [<c024afe8>] (kernfs_find_ns) from [<ee9cdc68>] (0xee9cdc68)
[    0.804687] Code: e5832028 e8bd8038 e92d40f0 e1a06002 (e1d024b4) 
[    0.810868] ---[ end trace 7d0e5449506e9287 ]---

 
> The error path was not updated correctly and in case
> regulator_ena_gpio_free failed, device_unregister was called even though
> it was not registered yet.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@tieto.com>
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/regulator/core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index 6ee9ba4..055f8c1 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -3919,7 +3919,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
>  		if (ret != 0) {
>  			rdev_err(rdev, "Failed to request enable GPIO%d: %d\n",
>  				 config->ena_gpio, ret);
> -			goto wash;
> +			goto clean;
>  		}
>  	}
>  
> @@ -3931,7 +3931,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
>  	ret = device_register(&rdev->dev);
>  	if (ret != 0) {
>  		put_device(&rdev->dev);
> -		goto clean;
> +		goto wash;
>  	}
>  
>  	dev_set_drvdata(&rdev->dev, rdev);
> @@ -3974,13 +3974,13 @@ unset_supplies:
>  
>  scrub:
>  	regulator_ena_gpio_free(rdev);
> -
> -wash:
>  	device_unregister(&rdev->dev);
>  	/* device core frees rdev */
>  	rdev = ERR_PTR(ret);
>  	goto out;
>  
> +wash:
> +	regulator_ena_gpio_free(rdev);
>  clean:
>  	kfree(rdev);
>  	rdev = ERR_PTR(ret);
> 

Otherwise ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon
