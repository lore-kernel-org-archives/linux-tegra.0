From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] usb: phy: remove unused APIs from Tegra PHY.
Date: Wed, 16 Jan 2013 10:18:33 -0700
Message-ID: <50F6E0E9.9000601@wwwdotorg.org>
References: <1358245170-22083-1-git-send-email-vbyravarasu@nvidia.com> <50F59A43.7050308@wwwdotorg.org> <20130116071235.GB610@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130116071235.GB610-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/16/2013 12:12 AM, Felipe Balbi wrote:
> Hi,
> 
> On Tue, Jan 15, 2013 at 11:04:51AM -0700, Stephen Warren wrote:
>> On 01/15/2013 03:19 AM, Venu Byravarasu wrote:
>>> As tegra_usb_phy_clk_disable/enable() are not being used,
>>> removing them.
>> 
>> Greg, Felipe,
>> 
>> Again if I may, I'll take this through the Tegra tree. I think
>> the next set of patches that Venu posts should actually expose
>> the dependencies between his USB patches and the Tegra clock
>> framework rework, which are why I want to do this.
> 
> that should be ok:
> 
> Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

Thanks. I've applied this to Tegra's for-3.9/usb branch.

BTW Venu, you forgot to Cc the linux-tegra mailing list; that's
probably more useful than linux-kernel for Tegra-specific driver changes.
