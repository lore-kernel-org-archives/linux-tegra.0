From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 4/4] usb: Add APIs to access host registers from Tegra
 PHY
Date: Fri, 18 Jan 2013 10:28:38 -0700
Message-ID: <50F98646.6040209@wwwdotorg.org>
References: <Pine.LNX.4.44L0.1301181029350.1988-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1301181029350.1988-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/18/2013 08:30 AM, Alan Stern wrote:
> On Fri, 18 Jan 2013, Venu Byravarasu wrote:
> 
>> As Tegra PHY driver needs to access one of the Host registers,
>> added few APIs.
>>
>> Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> delta from v2:
>> Renamed USB_PORTSC1 to TEGRA_USB_PORTSC1.
>> Removed tegra_ehci_set_wakeon_events() and its references.
>> Used standard defines for accessing PORTSC fields defined in ehci_def.h
>> Included OCC bit of PORTSC as part of TEGRA_PORTSC1_RWC_BITS.
>>
>> delta from v1:
>> Taken care of RWC bits, while accessing PORTSC register.
> 
> Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>

Felipe, you said on a previous version that you weren't sure if you
could ack this since it means the PHY driver is touching EHCI
registers... I don't think we really have much choice w.r.t. what the
driver is doing, since it's driven purely by HW design. Is this updated
patched at least OK for you not to NAK it, and hence I can apply it? Thanks.
