From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC] binding for nvec mfd device
Date: Wed, 31 Jul 2013 14:57:32 -0600
Message-ID: <51F97A3C.9010409@wwwdotorg.org>
References: <1416005.VvfEeGuSWa@ax5200p> <51F6E5BE.3080400@wwwdotorg.org> <20130731141314.GO29859@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130731141314.GO29859-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/31/2013 08:13 AM, Mark Rutland wrote:
> On Mon, Jul 29, 2013 at 10:59:26PM +0100, Stephen Warren wrote:
>> On 07/27/2013 07:23 AM, Marc Dietrich wrote:
>>> Hi,
>>>
>>> this is an RFC for an mfd device introduced here [1]. I didn't got much 
>>> response, except from Stephen, but that bothered me enough already ;-)

... [propose binding for Tegra I2C slave controller, and NVEC protocol
components]

>> One question I have here: There is a single I2C HW module on Tegra that
>> can act either as a master or a slave. I don't think it can do both at
>> once. Should we: ...
> 
> Is that configurable at run-time, or an integration decision?

It's certainly a run-time decision whether to operate the HW in master
or slave mode, and this is independent from anything on the board,
except of course for whether it actually makes sense to use master or
slave mode purely based on which external components are hooked up to
the bus.

I imagine that at least by appropriately resetting or reconfiguring it,
you could switch roles at run-time too. I don't know if you can actually
actively use both the master and slave portions of the HW at the exact
same time independently though. Marc is right that the diagrams in the
documentation certainly imply you can use both at the same time,
although I'm not totally convinced looking at the registers. I'm CCing
Laxman to answer that question, since he knows the HW better than I.
