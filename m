From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 2/3] Documentation: devicetree: phy-tegra-usb: Add
 vbus-supply property for host mode PHYs
Date: Mon, 29 Jul 2013 15:25:42 -0600
Message-ID: <51F6DDD6.8000502@wwwdotorg.org>
References: <1372422796-23524-1-git-send-email-mperttunen@nvidia.com> <1372422796-23524-3-git-send-email-mperttunen@nvidia.com> <51F6893E.6070604@wwwdotorg.org> <20130729211932.GA6901@radagast> <20130729212313.GB6901@radagast>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130729212313.GB6901@radagast>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/29/2013 03:23 PM, Felipe Balbi wrote:
> Hi,
> 
> On Tue, Jul 30, 2013 at 12:19:32AM +0300, Felipe Balbi wrote:
>> On Mon, Jul 29, 2013 at 09:24:46AM -0600, Stephen Warren wrote:
>>> On 06/28/2013 06:33 AM, Mikko Perttunen wrote:
>>>> Add vbus-supply as an optional property for host mode
>>>> phy-tegra-usb PHYs.
>>> 
>>> Felipe, I see that you didn't merge this one patch from this
>>> series. Was there a reason for that? At this stage, I would
>>> consider it reasonable for DT binding documentation changes to
>>> go through the same tree as driver changes.
>> 
>> no reason, just missed it. Will apply now.
> 
> actually, patch _is_ in my tree:
> 
> https://git.kernel.org/cgit/linux/kernel/git/balbi/usb.git/commit/?h=next&id=80bd8a94712a0a9f2baeb03ad0546dd70f27ac4e

Oh
> 
so it is, thanks. I was thrown off by the modified patch subject;
sorry.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
