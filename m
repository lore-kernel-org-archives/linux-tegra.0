From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 5/6] partitions/tegra: Support enforced GPT scanning
Date: Sat, 16 May 2020 08:52:41 -0700
Message-ID: <6d86e17f-6431-e9eb-6613-e8d6e889e079@infradead.org>
References: <20200516153644.13748-1-digetx@gmail.com>
 <20200516153644.13748-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200516153644.13748-6-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, =?UTF-8?Q?Nils_=c3=96stlund?= <nils@naltan.com>, Christoph Hellwig <hch@infradead.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Davidlohr Bueso <dave@stgolabs.net>
Cc: linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Steve McIntyre <steve@einval.com>, linux-efi <linux-efi@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 5/16/20 8:36 AM, Dmitry Osipenko wrote:
> diff --git a/block/partitions/efi.c b/block/partitions/efi.c
> index 3af4660bc11f..4eb4496fbb1b 100644
> --- a/block/partitions/efi.c
> +++ b/block/partitions/efi.c
> @@ -98,6 +98,12 @@ static int force_gpt;
>  static int __init
>  force_gpt_fn(char *str)
>  {
> +	/* This check allows to parse "gpt gpt_sector=" properly since
> +	 * "gpt" overlaps with "gpt_sector", see tegra_gpt_sector_fn().
> +	 */

same here.

> +	if (force_gpt)
> +		return 0;
> +
>  	force_gpt = 1;
>  	return 1;
>  }


-- 
~Randy
