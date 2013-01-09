From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH 04/11] ARM: Tegra: Define Tegra30 CAR binding
Date: Wed, 9 Jan 2013 17:42:00 +0200
Message-ID: <20130109154200.GA29605@tbergstrom-lnx.Nvidia.com>
References: <1356260751-3667-1-git-send-email-pgaikwad@nvidia.com>
 <1356260751-3667-5-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1356260751-3667-5-git-send-email-pgaikwad@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "mturquette@linaro.org" <mturquette@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Dec 23, 2012 at 12:05:44PM +0100, Prashant Gaikwad wrote:
> The device tree binding models Tegra30 CAR (Clock And Reset)
> as a single monolithic clock provider.
> 
> Signed-off-by: Prashant Gaikwad <pgaikwad@nvidia.com>

...

> +  81	i2cslow

...

> +  217	i2cslow

I guess 81 is the correct number?

Cheers,

Peter.
