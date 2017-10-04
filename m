From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH 0/9] Bringing Asus TF300T support to mainline
Date: Wed, 4 Oct 2017 23:25:34 +0200
Message-ID: <20171004212534.uosfz6757bbds2c5@qmqm.qmqm.pl>
References: <cover.1500510157.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <cover.1500510157.git.mirq-linux@rere.qmqm.pl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 20, 2017 at 02:29:22AM +0200, Micha=B3 Miros=B3aw wrote:
> Here is a suprisingly small set of patches that enable Asus TF300T tablet
> to boot and have all cores available. TF300T is one of a consumer devices
> based on NVidia's Cardhu reference tablet.
> =

> This series is an arch-dependent part. TF parts were extracted from ASUS's
> GPL code dump.  The rest being driver code - a work in progress - is
> available in branch tf300t at:
> =

>         https://rere.qmqm.pl/git/linux

Just a quick note, that I've rebased the branch on v4.14-rc3 and added
some more patches on top. This includes updated defconfig and devicetree
with working eMMC and an attempt at making TF300T's dock hot-pluggable.

Best Regards,
Micha=B3 Miros=B3aw
