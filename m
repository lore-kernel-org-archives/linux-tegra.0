From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH] staging: nvec: fix the '&&' vs '&' typo in
 nvec_toggle_global_events()
Date: Sat, 16 Mar 2013 22:33:24 +0100
Message-ID: <10181113.13atlJeaaa@ax5200p>
References: <CAPgLHd8rhMVb_cpVR6tiYsYTrOgk3m1PyR=Eo9L2_8bOGwwbag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <CAPgLHd8rhMVb_cpVR6tiYsYTrOgk3m1PyR=Eo9L2_8bOGwwbag@mail.gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel/>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: "devel" <devel-bounces@linuxdriverproject.org>
To: Wei Yongjun <weiyj.lk@gmail.com>, linux-tegra@vger.kernel.org
Cc: devel@driverdev.osuosl.org, swarren@wwwdotorg.org, gregkh@linuxfoundation.org, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, yongjun_wei@trendmicro.com.cn
List-Id: linux-tegra@vger.kernel.org

Hi Yongjun,

On Saturday 16 March 2013 22:51:25 Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Fix the '&&' vs '&' typo.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/staging/nvec/nvec.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index cf15936..a88959f 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -352,10 +352,10 @@ static void nvec_toggle_global_events(struct nvec_chip *nvec, bool state)
>   */
>  static void nvec_event_mask(char *ev, u32 mask)
>  {
> -	ev[3] = mask >> 16 && 0xff;
> -	ev[4] = mask >> 24 && 0xff;
> -	ev[5] = mask >> 0  && 0xff;
> -	ev[6] = mask >> 8  && 0xff;
> +	ev[3] = mask >> 16 & 0xff;
> +	ev[4] = mask >> 24 & 0xff;
> +	ev[5] = mask >> 0  & 0xff;
> +	ev[6] = mask >> 8  & 0xff;
>  }
>  
>  /**

yes, this was obviously wrong. Thanks for fixing!

Acked-By: Marc Dietrich <marvin24@gmx.de>
