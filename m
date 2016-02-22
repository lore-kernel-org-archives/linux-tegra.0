From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 57/61] gpio: wm8350: Use devm_gpiochip_add_data() for
 gpio registration
Date: Mon, 22 Feb 2016 16:29:08 +0000
Message-ID: <20160222162908.GB1490@localhost.localdomain>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
 <1456150130-2668-58-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1456150130-2668-58-git-send-email-ldewangan@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: gnurou@gmail.com, patches@opensource.wolfsonmicro.com, catalin.marinas@arm.com, shc_work@mail.ru, michael.hennerich@analog.com, corbet@lwn.net, linux-tegra@vger.kernel.org, rjui@broadcom.com, linus.walleij@linaro.org, swarren@wwwdotorg.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, thierry.reding@gmail.com, albeu@free.fr, bjorn.andersson@sonymobile.com, gregkh@linuxfoundation.org, a.kesavan@samsung.com, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, support.opensource@diasemi.com
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 22, 2016 at 07:38:46PM +0530, Laxman Dewangan wrote:
> Use devm_gpiochip_add_data() for GPIO registration and remove the
> need of driver callback .remove.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: patches@opensource.wolfsonmicro.com
> ---

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
