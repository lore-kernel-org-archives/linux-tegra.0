From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC PATCH v3 3/6] ARM/arm64: dts: enable wakeup for cros-ec-spi
 devices
Date: Wed, 21 Jun 2017 17:36:32 +0200
Message-ID: <20170621153632.7cajs5xwdmhdm2fg@kozik-lap>
References: <1498039313-24220-1-git-send-email-jeffy.chen@rock-chips.com>
 <1498039313-24220-4-git-send-email-jeffy.chen@rock-chips.com>
 <CAJKOXPdL2CB9VWNo=it0dos-4hJYrgHUSZwcG1DS=9c+YxXzhQ@mail.gmail.com>
 <594A91C9.1090906@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <594A91C9.1090906@rock-chips.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jeffy <jeffy.chen@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, dmitry.torokhov@gmail.com, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, briannorris@chromium.org, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, dianders@chromium.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 21, 2017 at 11:33:29PM +0800, jeffy wrote:
> Hi Krzysztof,
> 
> thanx for your comment.
> 
> On 06/21/2017 06:45 PM, Krzysztof Kozlowski wrote:
> > On Wed, Jun 21, 2017 at 12:01 PM, Jeffy Chen <jeffy.chen@rock-chips.com> wrote:
> > > We used to enable wakeup for cros-ec-spi devices unconditionally.
> > > Now we are using the more generic wakeup-source property to enable it.
> > 
> > Using wakeup-source property is still enabling this unconditionally.
> > What  do you exactly mean here?
> i mean the wakeup-source is an optional property, we can disable wakeup by
> not adding it.

Maybe mention this in commit msg? This removes any confusion. "Till now
the driver always enabled wakeup but now it supports wakeup property so
add it to keep same functionality."

Best regards,
Krzysztof
