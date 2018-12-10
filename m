From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: TK1: DRM, Nouveau and VIC
Date: Mon, 10 Dec 2018 16:38:26 +0000
Message-ID: <1cc57f2d95988965bae649a68f020b4a566625aa.camel@toradex.com>
References: <0c2db0d1c102a4f5a441f8e5a90f6793f329ada7.camel@toradex.com>
 <20181210102147.GF15154@ulmo> <20181210110056.GL15154@ulmo>
 <49ea16ae9b500551a68b001ed7ce064b2591fd04.camel@toradex.com>
 <20181210162317.GA4789@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181210162317.GA4789@ulmo>
Content-Language: en-US
Content-ID: <0C0A1212DDA4B34C812B0DF6136CDE68@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "mperttunen@nvidia.com" <mperttunen@nvidia.com>, "bskeggs@redhat.com" <bskeggs@redhat.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry

On Mon, 2018-12-10 at 17:23 +0100, Thierry Reding wrote:

Snip.

> > Looks like with pci_disable_device() it may take a rather strange
> > path...
> 
> Yikes... it has no business at all calling pci_disable_device() on
> Tegra. Unless if you happen to have a GPU plugged into the PCIe slot.
> I'm assuming that's not what you're doing?

Nope, I only have a Wi-Fi card behind a PCIe switch though (;-p).

> I'll see if I can reproduce (and fix) that crash on unload.
> Admittedly
> it's not something that I regularly test. Perhaps that's something
> that
> I should change...

Don't worry. After a couple of years working on this I happen to try
this the first time myself just now (;-p).

> Thierry

Cheers

Marcel
