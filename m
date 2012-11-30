From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Fri, 30 Nov 2012 08:54:32 +0200
Message-ID: <50B85828.4090405@nvidia.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	<1353935954-13763-2-git-send-email-tbergstrom@nvidia.com>
	<20121128212301.GA25531@avionic-0098.adnet.avionic-design.de>
	<50B73710.2040102@nvidia.com> <50B7AAA6.70702@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <50B7AAA6.70702@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

On 29.11.2012 20:34, Stephen Warren wrote:
> On 11/29/2012 03:21 AM, Terje Bergstr=F6m wrote:
>> True. I might also as well delete the general interrupt altogether, as
>> we don't use it for any real purpose.
> =

> Do make sure the interrupts still are part of the DT binding though, so
> that the binding fully describes the HW, and the interrupt is available
> to retrieve if we ever do use it in the future.

Sure, I will just not use the generic irq in DT, but it won't require
any changes in DT bindings.

> You can still create tables of clocks inside the driver and loop over
> them. So, loop unrolling isn't related to my comments at least. It's
> just that clk_get() shouldn't take its parameters from platform data.
> =

> But if these are clocks for (arbitrary) child modules (that may or may
> not exist dynamically), why aren't the drivers for the child modules
> managing them?

There are actually two things here that I mixed, and because of that I
probably confused everybody else.

Let's rip out the ACM. ACM is generic to all modules, and in nvhost owns
the clocks. That's why list of clocks and their frequency policies have
been part of the device description in nvhost. ACM is being replaced
with runtime PM in downstream kernel, but it still requires rigorous
testing and analysis of power profile before we can move to it.

Then, the second thing is that nvhost_probe() has had its own loop to go
through the clocks of host1x module. It's copy-paste of what ACM did,
which is just bad design. That's easily replaceable with static code, as
nvhost_probe() is just for host1x. I'll do that, and as I rip out the
generic power management code, I'll also make 2D and host1x drivers
enable the clocks at probe with static code.

So I think we have a solution that resonates with all proposals.

Best regards,
Terje
