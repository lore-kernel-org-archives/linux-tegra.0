From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v3 4/4] usb: Add APIs to access host registers from Tegra
 PHY
Date: Fri, 18 Jan 2013 11:20:04 -0700
Message-ID: <50F99254.7030505@wwwdotorg.org>
References: <Pine.LNX.4.44L0.1301181029350.1988-100000@iolanthe.rowland.org> <50F98646.6040209@wwwdotorg.org> <20130118175811.GD1035@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130118175811.GD1035@arwen.pp.htv.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com
Cc: Alan Stern <stern@rowland.harvard.edu>, Venu Byravarasu <vbyravarasu@nvidia.com>, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 01/18/2013 10:58 AM, Felipe Balbi wrote:
> On Fri, Jan 18, 2013 at 10:28:38AM -0700, Stephen Warren wrote:
>> On 01/18/2013 08:30 AM, Alan Stern wrote:
>>> On Fri, 18 Jan 2013, Venu Byravarasu wrote:
>>> 
>>>> As Tegra PHY driver needs to access one of the Host
>>>> registers, added few APIs.
>>>> 
>>>> Signed-off-by: Venu Byravarasu <vbyravarasu@nvidia.com> --- 
>>>> delta from v2: Renamed USB_PORTSC1 to TEGRA_USB_PORTSC1. 
>>>> Removed tegra_ehci_set_wakeon_events() and its references. 
>>>> Used standard defines for accessing PORTSC fields defined in
>>>> ehci_def.h Included OCC bit of PORTSC as part of
>>>> TEGRA_PORTSC1_RWC_BITS.
>>>> 
>>>> delta from v1: Taken care of RWC bits, while accessing PORTSC
>>>> register.
>>> 
>>> Acked-by: Alan Stern <stern@rowland.harvard.edu>
>> 
>> Felipe, you said on a previous version that you weren't sure if
>> you could ack this since it means the PHY driver is touching
>> EHCI registers... I don't think we really have much choice w.r.t.
>> what the driver is doing, since it's driven purely by HW design.
>> Is this updated patched at least OK for you not to NAK it, and
>> hence I can apply it? Thanks.
> 
> Sure I will not block it, please go ahead and apply it through your
> tree ;-)

Great, thanks very much.

Are patch 2/4 and 3/4 OK; could you Ack them since they touch USB PHY
code?

I guess in the interests of moving this USB rework forward, I'll
actually fix up the issue with assigning phy->is_ulpi_phy while I
apply the patches, just by moving that one chunk of code from patch 4
to patch 3.
