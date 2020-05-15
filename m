From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: Re: [PATCH v8 2/6] ARM: tegra: Add device-tree for ASUS Google Nexus
 7
Date: Fri, 15 May 2020 20:18:47 +0200
Message-ID: <20200515181847.GA13860@qmqm.qmqm.pl>
References: <20200514213654.12834-1-digetx@gmail.com>
 <20200514213654.12834-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200514213654.12834-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pedro =?iso-8859-2?Q?=C2ngelo?= <pangelo-yxaQD43p5Qo@public.gmane.org>, Matt Merhar <mattmerhar-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>, Zack Pearsall <zpearsall-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, May 15, 2020 at 12:36:50AM +0300, Dmitry Osipenko wrote:
> There are few hardware variants of NVIDIA Tegra30-based Nexus 7 device:
> 
> 1. WiFi-only (named Grouper)
> 2. GSM (named Tilapia)
> 3. Using Maxim PMIC (E1565 board ID)
> 4. Using Ti PMIC (PM269 board ID)

Hi,

I've briefly looked at the PM269 devicetree (PMIC part) and it looks very
similar, if not the same, to what I deduced from the TF300T kernel.
Those devices don't look to differ much from original Cardhu tablet
devkit, so maybe the trees can base off of that?

I would also guess that because of this 'ram-code', memory timings would
be duplicated between devices. I can see small differences between
ram-code=1 timings of Grouper and TF300T, though they look like arbiter
tuning differences. I'll have to test if my TF300T works with Grouper's
settings. In case they work, could you split the memory timings to another
dtsi file?

BTW, shouldn't EMC timing set match MC? I see more frequencies listed in
MC than EMC nodes.

Best Regards,
Micha³ Miros³aw
