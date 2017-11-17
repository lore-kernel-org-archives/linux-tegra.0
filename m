From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [bug report] crash in nouveau_cli_init (booting TX2 with gpu
 enabled)
Date: Fri, 17 Nov 2017 08:56:58 +0200
Message-ID: <788f344b-9d68-ac3d-c3ed-52f2a278aa45@kapsi.fi>
References: <CAHMsQjXQS9f-c+RU44kNi6RGcphhYFTGzNFzKmQEq2kemV3ORw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHMsQjXQS9f-c+RU44kNi6RGcphhYFTGzNFzKmQEq2kemV3ORw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anthony Eden <aeden-EfZU8u+QLuPpgkiH4x7ZXw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

See my message to the nouveau ML (not sure why I didn't Cc here)

https://lists.freedesktop.org/archives/nouveau/2017-November/029090.html

With -next I've managed (with the patches mentioned in above) to make it 
probe and not crash in general but GPU jobs are failing. The above also 
contains the last commit I've managed to make it work with. I'm going to 
continue trying to find the issue, but in general something broke with 
Ben Skeggs' recent big VMM refactoring.

Mikko

On 11/17/2017 12:23 AM, Anthony Eden wrote:
> After adding the following to tegra186-p2771-0000.dts:
> 
> gpu@17000000 {
>    status = "okay";
> };
> 
> My Jetson TX2 fails to boot with linux-next 20171116.
> 
> Besides a WARNING at
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c:391, I get a kernel
> NULL pointer dereference in nouveau_cli_init.
> 
> The complete serial console output is attached. I hope this can be of use.
> 
> -Anthony
> 
