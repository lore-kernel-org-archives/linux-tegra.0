From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] pinctrl: tegra: remove fsafe from data tables
Date: Tue, 22 Apr 2014 16:52:10 +0200
Message-ID: <CACRpkdYw+YBnqAzSu0yZZhi_id6PGJVPdk1yjJZzgxbFC2wsqw@mail.gmail.com>
References: <1397511222-28533-1-git-send-email-swarren@wwwdotorg.org>
 <1397511222-28533-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1397511222-28533-2-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 14, 2014 at 11:33 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:

> From: Stephen Warren <swarren@nvidia.com>
>
> The fsafe value in the pingroup data tables is only used to implement
> tegra_pinctrl_disable(). The only reason this function is called is when
> dynamically switching between pinmux states, i.e. when disabling the old
> state before programming the new state. It's simpler to have the new
> target state define the expected value of each pin (and all current DTs
> do that). This also gives more flexibility, since it allows individual
> boards explicit control over the "inactive" mux function for each pin,
> rather than requiring it to be an SoC-specific value. Assuming this, we
> can get rid of the fsafe value from the driver completely, thus saving
> some more space in the driver tables.
>
> While re-writing the content of tegra124_pingroups[], fix the indentation
> to use a TAB instead of spaces.
>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>

Patch applied with Laxman's ACK.

Yours,
Linus Walleij
