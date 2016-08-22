From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 02/12] mailbox: Add Tegra HSP driver
Date: Mon, 22 Aug 2016 15:43:23 +0200
Message-ID: <13954058.6YHDe1jCOJ@wuerfel>
References: <20160819173233.13260-1-thierry.reding@gmail.com>
 <20160819173233.13260-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160819173233.13260-3-thierry.reding@gmail.com>
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
Cc: Sivaram Nair <sivaramn@nvidia.com>, devicetree@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, Timo Alho <talho@nvidia.com>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Friday, August 19, 2016 7:32:23 PM CEST Thierry Reding wrote:
> +static int tegra_hsp_doorbell_send_data(struct tegra_hsp_channel *channel,
> +                                       void *data)
> +{
> +       tegra_hsp_channel_writel(channel, 1, HSP_DB_TRIGGER);
> +
> +       return 0;
> +}
> 

It seems very odd that you don't write the data at all but just trigger
the communication here. My interpretation is that you bypass
the mailbox infrastructure for the actual message, and instead reimplement
it on top of the mailbox infrastructure as part of the bpmp driver.

Why not expose the bpmp itself as the mailbox here?

	Arnd
