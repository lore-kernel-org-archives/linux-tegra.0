From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH 1/5] irqchip/gic-pm: add driver remove support
Date: Wed, 13 Mar 2019 19:20:24 +0530
Message-ID: <bc00b804-2248-4f8b-1537-3e3db151d74d@nvidia.com>
References: <1552474956-25513-1-git-send-email-spujar@nvidia.com>
 <0cd78fb7-4bcb-b735-54ca-24a179b9ff72@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <0cd78fb7-4bcb-b735-54ca-24a179b9ff72@arm.com>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>, tglx@linutronix.de, jason@lakedaemon.net, catalin.marinas@arm.com, heiko@sntech.de, horms+renesas@verge.net.au, maxime.ripard@bootlin.com, andy.gross@linaro.org, olof@lixom.net, bjorn.andersson@linaro.org, jagan@amarulasolutions.com, enric.balletbo@collabora.com, stefan.wahren@i2se.com, ezequiel@collabora.com, marc.w.gonzalez@free.fr, christoffer.dall@arm.com, drjones@redhat.com, julien.thierry@arm.com
Cc: will.deacon@arm.com, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, treding@nvidia.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


On 3/13/2019 4:52 PM, Marc Zyngier wrote:
> First things first:
>
> - Where is the cover letter?
> - This series should be flagged as v2, as it not the same as the one you
> sent last week.
I had the dilemma whether to name this series as v2 or not, thought the 
commits
in the series are different and v2 may not be necessary.
Also felt commit messages are descriptive enough and all belong to 
irq-gic-pm,
hence did not send cover letter.
If you suggest so, I will send a cover letter next patch version(v2)
>
> On 13/03/2019 11:02, Sameer Pujar wrote:
>> This is a preparatory patch for using irq-gic-pm driver as module and thus
>> implement remove() call for the driver. Details of remove() are as below,
>>
>>   * pm_runtime_force_suspend() is added to balance runtime PM, otherwise
>>     following is seen: "agic-controller: Unbalanced pm_runtime_enable!"
>>   * Function gic_teardown() is exported from gic driver and called in remove
>>     to perform io unmap.
>>   * pm_clk_destroy() to free clock resources
>>   * irq is unmapped and freed with irq_dispose_mapping()
>>
> Let's be clear, I have no desire to export any GIC symbol at all. Why
> should we do this? This "driver" is the tiniest thing, and making it
> modular doesn't get us anything.
>
> So what's the rational for doing so?
Reason for this was, the driver gets used for AGIC block and audio is not
boot critical and hence module option was preferred.

Thanks,
Sameer.

>
> Thanks,
>
> 	M.
