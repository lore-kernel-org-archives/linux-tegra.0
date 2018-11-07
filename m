From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 0/3] arm64: tegra: Updates for v4.20-rc2
Date: Wed, 7 Nov 2018 08:31:55 -0800
Message-ID: <CAOesGMjcOQif8H6b5afKBwYstkbzGC7wuUcN2Srz=vJz11qSnA@mail.gmail.com>
References: <20181107145350.29127-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181107145350.29127-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, ARM-SoC Maintainers <arm@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On Wed, Nov 7, 2018 at 6:53 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> Hi ARM SoC maintainers,
>
> These pull requests are some follow-up changes to finally enable the
> generic power domains for the Tegra XUSB block. This builds on top of
> changes that were merged into v4.20-rc1, but because of some non-
> trivial runtime dependencies I decided to hold back on these until
> after the dust had settled.
>
> Do you think it would be possible to merge these in for v4.20-rc2? I
> realize that they are not actually fixes, but they merely add a couple
> of lines to enable the power domains for XUSB as well as the
> corresponding DT bindings.

Is anything broken without these changes, or is it more that the
dependency have landed and you're itching to get things enabled?

If it's the former we should chat (since it's an unfortunate
situation). If it's the latter I'm happy to queue them up for the next
merge window.


-Olof
