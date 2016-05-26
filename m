From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 1/5] usb: chipidea: Add support for Tegra20/30/114/124
Date: Thu, 26 May 2016 15:17:12 -0600
Message-ID: <574767D8.8020203@wwwdotorg.org>
References: <20160526154005.11558-1-thierry.reding@gmail.com>
 <20160526154005.11558-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160526154005.11558-2-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/26/2016 09:40 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> All of these Tegra SoC generations have a ChipIdea UDC IP block that can
> be used for device mode communication with a host. Implement rudimentary
> support that doesn't allow switching between host and device modes.

Are you sure this is correct for Tegra20? I ask because for the /host/ 
mode driver, there's a "has_hostpc" flag which is set to false for 
Tegra20 and true for all other SoCs. In the U-Boot device mode driver 
(if not in the kernel driver; I didn't check), there's a concept of "has 
hostpc" too. I might expect that flag to be set the same way for both 
drivers. That said, I /think/ the host and device HW are unrelated, so 
it's possible has_hostpc might be set differently for them. 
Unfortunately, we haven't enabled the device mode driver for any Tegra20 
system in U-Boot so I can't tell whether we should enable has_hostpc for 
Tegra20's device mode driver.

Still, if this code works then I guess it's likely correct...
