From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Date: Fri, 8 May 2020 18:00:57 +0300
Message-ID: <f149bb64-e93b-364e-47bc-c851e9638a35@gmail.com>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
 <2a0404ac-73bf-2f27-9147-8bef28ae995f@gmail.com>
 <20200508103130.GB3030605@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200508103130.GB3030605@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

08.05.2020 13:31, Thierry Reding пишет:
...
>> Is it legal to touch DPAUX registers while DPAUX is in a suspended state?
> 
> DPAUX is never runtime suspended and the dependency from the I2C
> controller on DPAUX should ensure that they are suspended and resumed in
> the right order during system sleep.

1. Could you please explain why DPAUX is never suspended? Isn't it a
problem?

It looks a bit odd that driver is doing this [1][2]. RPM is supposed to
be used for the *dynamic* power management. Should we remove RPM usage
from the DPAUX driver?

[1]
https://elixir.bootlin.com/linux/v5.7-rc4/source/drivers/gpu/drm/tegra/dpaux.c#L524
[2]
https://elixir.bootlin.com/linux/v5.7-rc4/source/drivers/gpu/drm/tegra/dpaux.c#L591

2. Could you please explain why I2C driver has to care about restoring
the pinmux state? Why pinctrl driver isn't doing that for I2C and
everything else?
