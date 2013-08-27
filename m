From: "Sherman Yin" <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH v3] pinctrl: Pass all configs to driver on pin_config_set()
Date: Tue, 27 Aug 2013 18:22:31 +0000
Message-ID: <051069C10411E24D9749790C498526FA1BDDF56E@SJEXCHMB12.corp.ad.broadcom.com>
References: <1377134300-25480-1-git-send-email-syin@broadcom.com>
 <1377484899-4918-1-git-send-email-syin@broadcom.com>
 <6659378.X3XNCLDVvV@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <6659378.X3XNCLDVvV@avalon>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rpi-kernel/>
List-Post: <mailto:linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel>,
 <mailto:linux-rpi-kernel-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "linux-rpi-kernel" <linux-rpi-kernel-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rpi-kernel-bounces+glkr-linux-rpi-kernel=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Srinidhi Kasagar <srinidhi.kasagar-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Christian Daudt <csd-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-r>
List-Id: linux-tegra@vger.kernel.org

Hi Laurent,

>> diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c
>> b/drivers/pinctrl/sh-pfc/pinctrl.c index 8649ec3..ced199e 100644
>> --- a/drivers/pinctrl/sh-pfc/pinctrl.c
>> +++ b/drivers/pinctrl/sh-pfc/pinctrl.c
>> @@ -529,38 +529,44 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev
>> *pctldev, unsigned _pin, }
>>
>>  static int sh_pfc_pinconf_set(struct pinctrl_dev *pctldev, unsigned _pin,
>> -			      unsigned long config)
>> +			      unsigned long *configs, unsigned num_configs)
>>  {
>>  	struct sh_pfc_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
>>  	struct sh_pfc *pfc = pmx->pfc;
>> -	enum pin_config_param param = pinconf_to_config_param(config);
>> +	enum pin_config_param param;
>>  	unsigned long flags;
>> +	int i;
>
>Could you please make this an unsigned int ?
>
>Other than that the sh-pfc part looks good to me.
 
Thanks for the review.  I'll make this change.  Can I add you as a 
Reviewed-by?

I just realized I didn't include the linux-arm-kernel maillist in my v3 patch, so 
I'll make this change send out a v4.  

Regards,
Sherman
