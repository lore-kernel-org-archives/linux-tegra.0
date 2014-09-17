From: Mikko Perttunen <mikko.perttunen@kapsi.fi>
Subject: Re: [PATCH v3 0/9] Tegra xHCI support
Date: Wed, 17 Sep 2014 16:45:19 +0300
Message-ID: <5419906F.1060605@kapsi.fi>
References: <1409693701-16520-1-git-send-email-abrestic@chromium.org>	<CAAObsKAYqpJMJnxSMxhkkRtnoEwLwgUa1y7ij5ZHvHf1jRok+Q@mail.gmail.com>	<CAL1qeaF7U9aoBp5gQPS=r+pe6krKmXdP1qak2gjhNqQMoHFB8A@mail.gmail.com>	<CAAObsKAXO-pBtqd1jNj8faXqpE+5Wb0RFzPp+jn9FH0B=dHq8g@mail.gmail.com>	<CAL1qeaEk_r5XAKvvJfwXN9+Wi9EjC_2MgBfoP92TK=F+Ou9QTA@mail.gmail.com>	<CAAObsKAwgfx1g2p7PQP+=HudvAHHpcPi47gEH6BrxEgLu6w2VQ@mail.gmail.com>	<CAL1qeaEC9O8-jgjGC44cFctoZPpp4dRVfQ=mhSb_2on7GgiU0w@mail.gmail.com>	<54172B3F.9030901@wwwdotorg.org>	<CAL1qeaEK=C4j+G5CA_91xJNe25d=-y47EyZAYnaMh46fNYVDAw@mail.gmail.com>	<54185698.7020600@wwwdotorg.org> <CAL1qeaGf6JSuq=ekZY7Pp2zSAB0+0S9fZ70xWpct2MJ=pTSmug@mail.gmail.com> <5418BC5C.5020108@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5418BC5C.5020108@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Andrew Bresticker <abrestic@chromium.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Thierry Reding <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Grant Likely <grant.likely@linaro.org>, Alan Stern <stern@rowland.harvard.edu>, Arnd Bergmann <arnd@arndb.de>, Kishon Vijay Abraham I <kishon@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.in>
List-Id: linux-tegra@vger.kernel.org

On 09/17/2014 01:40 AM, Stephen Warren wrote:
> That's a huge time-sink, unless I work out NFS root,
> which probably isn't properly or easily supported by any distro.

FWIW, this is how I've been working, and it hasn't been /that/ difficult 
to get working. The Tegra side is trivial, just append something like

ip=dhcp root=/dev/nfs 
nfsroot=host_ip:/your/nfsroot,v3,rsize=8192,wsize=8192,timeo=15

(Granted, I had to do a bit of mucking around before finding this 
working incantation..)

to the kernel boot arguments. I've used Ubuntu 12.04, 13.10 and Arch 
Linux on my Jetson in this way. The more annoying part is the nfs host 
machine, but there are guides for that. Anyway, I've had both Ubuntu 
12.04 and Arch working as hosts without problems.

Mikko
