From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/9] mailbox: Add NVIDIA Tegra XUSB mailbox driver
Date: Tue, 26 Aug 2014 13:35:34 +0200
Message-ID: <14224406.FU8QFA3vsD@wuerfel>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org>
 <5184912.mY2hCPH20k@wuerfel> <20140826102011.GA31124@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140826102011.GA31124@ulmo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Bresticker <abrestic@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, David Howells <dhowells@redhat.com>, Jonas Bonn <jonas@southpole.se>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Alan Stern <stern@rowland.harvard.edu>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 26 August 2014 12:20:13 Thierry Reding wrote:
> On Tue, Aug 26, 2014 at 11:54:43AM +0200, Arnd Bergmann wrote: > 
> > I'm not sure if it's really worth it. One thing we might do is just
> > remove all definitions of ioremap_nocache and add a wrapper to
> > include/linux/io.h, to make it more obvious what is going on.
> 
> Yes, I suppose that would work too. I still think there's an advantage
> in being explicit and avoid aliases like this. Perhaps a __deprecated
> annotation would help with that?

I fear adding __deprecated would be too controversial, because that
would add hundreds of new warnings to code that is not actually wrong.

	Arnd
