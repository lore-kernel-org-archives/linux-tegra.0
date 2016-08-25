From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/6] i2c: tegra: Remove non device-tree support
Date: Thu, 25 Aug 2016 21:49:37 +0100
Message-ID: <1010511e-baa6-2792-90a4-30fc49628de8@nvidia.com>
References: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
 <1470910620-9898-3-git-send-email-jonathanh@nvidia.com>
 <20160825193314.GB1614@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160825193314.GB1614@katana>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 25/08/16 20:33, Wolfram Sang wrote:
> * PGP Signed by an unknown key
> 
> On Thu, Aug 11, 2016 at 11:16:56AM +0100, Jon Hunter wrote:
>> Tegra has only supported device-tree for platform/board configuration
>> for quite some time now and so simplify the Tegra I2C driver by dropping
>> code for non device-tree platforms/boards.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> cppcheck rightfully says:
> 
> drivers/i2c/busses/i2c-tegra.c:854: style: Variable 'i2c_dev.hw' is reassigned a value before the old one has been used.
> 
> Dropping the patches...

Yes good catch. I will fix that.

Cheers
Jon

-- 
nvpublic
