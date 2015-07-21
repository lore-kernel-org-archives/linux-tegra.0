From: Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
Subject: Re: [PATCH v3 4/4] dt: paz00: define nvec as child of i2c bus
Date: Tue, 21 Jul 2015 11:51:15 +0300
Message-ID: <55AE0803.10603@mail.ru>
References: <1437424546-30405-1-git-send-email-danindrey@mail.ru> <55AD73F4.2050502@wwwdotorg.org> <55ADE829.4030108@mail.ru> <4778199.vGjAP5lpOS@fb07-iapwap2>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4778199.vGjAP5lpOS@fb07-iapwap2>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-tBiZLqfeLfOHmIFyCCdPziST3g8Odh+X@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 21.07.2015 11:25, Marc Dietrich wrote:
> I think in this case it would be better to leave nvec and dt as it is for now,
> and just add the slave function to tegra-i2c. Otherwise we will again have two
> different "nvidia,nvec-slave" bindings (one for the intermediate hack and one
> for the final representation). As an alternative, you could also add slave
> function and port nvec in the same series.
>
First patch only adds slave functionality to tegra-i2c driver. I sent v3 
to fix only tegra-i2c as Wolfram suggested.

Unfortunately I haven't fixed all defects and I will resend patch(es).
I can resend only first patch (for tegra-i2c) if it is more obvious for 
everyone.
