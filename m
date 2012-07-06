From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 03/15] ARM: tegra: use fixed PCI i/o mapping
Date: Fri, 06 Jul 2012 15:01:41 -0600
Message-ID: <4FF75235.2050104@wwwdotorg.org>
References: <1341600040-30993-1-git-send-email-robherring2@gmail.com> <1341600040-30993-4-git-send-email-robherring2@gmail.com> <4FF74028.6090300@wwwdotorg.org> <4FF74689.8070103@gmail.com> <4FF74789.8000804@wwwdotorg.org> <4FF74C61.4060903@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FF74C61.4060903-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

(cutting down CCs for Tegra-specific discussion)

On 07/06/2012 02:36 PM, Stephen Warren wrote:
> On 07/06/2012 02:16 PM, Stephen Warren wrote:
>> On 07/06/2012 02:11 PM, Rob Herring wrote:
>>> On 07/06/2012 02:44 PM, Stephen Warren wrote:
>>>> On 07/06/2012 12:40 PM, Rob Herring wrote:
>>>>> From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>>>>
>>>>> Move tegra PCI to fixed i/o mapping and remove io.h.
>>>>
>>>> Thierry, since you're the Tegra PCIe expert right now, could you please
>>>> test and/or comment on this.
>>>>
>>>> I did try testing this on next-20120705 on TrimSlice (i.e. the
>>>> PCIe-based Ethernet controller), but found that PCIe has stopped working
>>>> there due to "resource collisions". I know this used to work fairly
>>>> recently, since I tested it when I added the PCIe initialization call to
>>>> board-dt-tegra20.c. The PCIe messages are:
>>>
>>> This is with my change and it works currently without?
>>
>> Sorry, no, it's broken even without your change. Hence, I can't test the
>> impact of your change. Well, I saw the same failure with your patches
>> too, but that isn't really conclusive testing of your change:-)
> 
> Aha. The PCIe problem only shows up when booting TrimSlice using DT (in
> next-20120705 or Tegra's for-next branch).
> 
> When booting using board files, PCIe works, both without and with your
> patch, on top of next-20120705.
> 
> So, your patches are tested on Tegra and still working.

I haven't root-caused it, but I have found what changed that triggered
the problem:

When I first wrote the patch to board-dt-tegra20.c that brought DT
booting up to feature parity with non-DT boot, IIRC, I wrote a
late_initcall() to run whatever code I added. I'm sure I tested
TrimSlice PCIe when booting using DT then, since that was the whole
point of the patch.

Later, I revised the patch to sit on top of Shawn Guo's .init_late
machine descriptor patch, and ran the code from there instead. However,
this appears to have broken PCIe on Trimslice; I must have screwed up
the testing of that change. I don't know why this causes a behavior
difference though; perhaps some resource acquisition race condition.

But just reverting that change doesn't fix the problem; I need to switch
to a *subsys*_initcall() instead (which is in fact what the Trimslice
board file uses for PCIe init). In other words:

diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c
b/arch/arm/mach-tegra/board-dt-tegra20.c
index 70a19a9..74aefaf 100644
--- a/arch/arm/mach-tegra/board-dt-tegra20.c
+++ b/arch/arm/mach-tegra/board-dt-tegra20.c
@@ -145,19 +145,20 @@ static struct {
 #endif
 };

-static void __init tegra_dt_init_late(void)
+static int __init tegra_dt_init_late(void)
 {
 	int i;

-	tegra_init_late();
-
 	for (i = 0; i < ARRAY_SIZE(board_init_funcs); i++) {
 		if (of_machine_is_compatible(board_init_funcs[i].machine)) {
 			board_init_funcs[i].init();
 			break;
 		}
 	}
+
+	return 0;
 }
+subsys_initcall(tegra_dt_init_late);

 static const char *tegra20_dt_board_compat[] = {
 	"nvidia,tegra20",
@@ -171,7 +172,7 @@ DT_MACHINE_START(TEGRA_DT, "nVidia Tegra20
(Flattened Device Tree)")
 	.handle_irq	= gic_handle_irq,
 	.timer		= &tegra_timer,
 	.init_machine	= tegra_dt_init,
-	.init_late	= tegra_dt_init_late,
+	.init_late	= tegra_init_late,
 	.restart	= tegra_assert_system_reset,
 	.dt_compat	= tegra20_dt_board_compat,
 MACHINE_END
