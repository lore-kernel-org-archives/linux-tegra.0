From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: dynamically control fast clk
Date: Fri, 17 Aug 2012 13:07:50 -0600
Message-ID: <502E9686.1030209@wwwdotorg.org>
References: <1345189711-24104-1-git-send-email-ldewangan@nvidia.com> <502E9051.4090507@wwwdotorg.org> <502E914A.1030906@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <502E914A.1030906-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org" <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>, "ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org" <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, "w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 08/17/2012 12:45 PM, Laxman Dewangan wrote:
> On Saturday 18 August 2012 12:11 AM, Stephen Warren wrote:
>> On 08/17/2012 01:48 AM, Laxman Dewangan wrote:
>>> Tegra I2C driver enables the fast clock during initialization
>>> and does not disable till driver removed.
>>> Enable this clock before transfer and disable after transfer done.
>>>
>>> Signed-off-by: Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>> This patch is on top of the clock chnages which is in Tegra sub
>>> system and
>>> based on
>>>   i2c: tegra: I2_M_NOSTART functionality not supported in Tegra20
>>> So recommend to go on tegra sub-system.
>> What exactly is this patch based on? I checked out Tegra's
>> for-3.7/drivers-i2c, cherry-picked the M_NOSTART patch you mentioned,
>> and attempted to apply this patch. It doesn't apply. Same if I don't
>> cherry-pick the M_NOSTART patch, and same for next-20120816 with/without
>> the M_NOSTART patch.
> 
> Then It seems I need to create the patch again and send it.  The
> M_NOSTART patch was on tot before clock related change and that is the
> reason it is not applying.
> Should I re-send these two patches together as 1/2 and 2/2 to maintain
> sequence?
> I can create based on your clock tree.

For any I2C-related changes I take through the Tegra tree, basing them
on top of for-3.7/drivers-i2c would be best. Feel free to send both
patches together again if that's easiest.
