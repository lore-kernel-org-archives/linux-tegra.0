From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] staging: nvec: add missing blank line after declarations
Date: Wed, 9 Jul 2014 12:16:14 -0700
Message-ID: <20140709191614.GA3716@kroah.com>
References: <1404749141-3943-1-git-send-email-pawel.lebioda89@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1404749141-3943-1-git-send-email-pawel.lebioda89@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Pawel Lebioda <pawel.lebioda89@gmail.com>
Cc: devel@driverdev.osuosl.org, Julian Andres Klode <jak@jak-linux.org>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 07, 2014 at 06:05:41PM +0200, Pawel Lebioda wrote:
> Fix 'missing blank line after declaration' warnings reported by checkpatch.pl.
> Signed-off-by: Pawel Lebioda <pawel.lebioda89@gmail.com>
> ---
>  drivers/staging/nvec/nvec_paz00.c | 1 +
>  drivers/staging/nvec/nvec_power.c | 1 +
>  drivers/staging/nvec/nvec_ps2.c   | 2 ++
>  3 files changed, 4 insertions(+)

I applied your first version of this patch :)

thanks,

greg k-h
