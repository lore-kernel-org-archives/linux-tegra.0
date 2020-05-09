From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Date: Sat, 9 May 2020 18:35:41 +0300
Message-ID: <86fee5a3-fe2f-05ab-bc05-1c441d2845e9@gmail.com>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
 <2a0404ac-73bf-2f27-9147-8bef28ae995f@gmail.com>
 <20200508103130.GB3030605@ulmo>
 <f149bb64-e93b-364e-47bc-c851e9638a35@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f149bb64-e93b-364e-47bc-c851e9638a35-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

> 2. Could you please explain why I2C driver has to care about restoring
> the pinmux state? Why pinctrl driver isn't doing that for I2C and
> everything else?

Although, now I see what you meant in the commit's message.

Perhaps the "their I2C controllers may have lost the pinmux state in
hardware" paragraph should be removed from the commit's message because
it's irrelevant to this patch. The pinctrl state is changed once
tegra_i2c_runtime_resume() is invoked and it is not about the change
made by this patch.
