From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: Detach driver on unregister
Date: Thu, 9 Apr 2020 09:02:02 -0700
Message-ID: <a1223208-9571-317f-364d-f1101c4be174@nvidia.com>
References: <20200408173802.3077833-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200408173802.3077833-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 4/8/20 10:38 AM, Thierry Reding wrote:
> From: Thierry Reding<treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Currently when a host1x device driver is unregistered, it is not
> detached from the host1x controller, which means that the device
> will stay around and when the driver is registered again, it may
> bind to the old, stale device rather than the new one that was
> created from scratch upon driver registration. This in turn can
> cause various weird crashes within the driver core because it is
> confronted with a device that was already deleted.
>
> Fix this by detaching the driver from the host1x controller when
> it is unregistered. This ensures that the deleted device also is
> no longer present in the device list that drivers will bind to.
>
> Reported-by: Sowjanya Komatineni<skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding<treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---

Tested-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
