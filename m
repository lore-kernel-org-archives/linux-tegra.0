From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 4/6] partitions/efi: Support GPT entry lookup at a
 non-standard location
Date: Sat, 16 May 2020 08:51:58 -0700
Message-ID: <2ae298ca-016a-8867-52dd-86d99b9e0f3b@infradead.org>
References: <20200516153644.13748-1-digetx@gmail.com>
 <20200516153644.13748-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-block-owner@vger.kernel.org>
In-Reply-To: <20200516153644.13748-5-digetx@gmail.com>
Content-Language: en-US
Sender: linux-block-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, =?UTF-8?Q?Nils_=c3=96stlund?= <nils@naltan.com>, Christoph Hellwig <hch@infradead.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Davidlohr Bueso <dave@stgolabs.net>
Cc: linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Steve McIntyre <steve@einval.com>, linux-efi <linux-efi@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 5/16/20 8:36 AM, Dmitry Osipenko wrote:
> diff --git a/block/partitions/efi.c b/block/partitions/efi.c
> index b64bfdd4326c..3af4660bc11f 100644
> --- a/block/partitions/efi.c
> +++ b/block/partitions/efi.c
> @@ -621,6 +621,14 @@ static int find_valid_gpt(struct parsed_partitions *state, gpt_header **gpt,
>          if (!good_agpt && force_gpt)
>                  good_agpt = is_gpt_valid(state, lastlba, &agpt, &aptes);
>  
> +	/* The force_gpt_sector is used by NVIDIA Tegra partition parser in
> +	 * order to convey a non-standard location of the GPT entry for lookup.
> +	 * By default force_gpt_sector is set to 0 and has no effect.
> +	 */

Please fix the multi-line comment format as described in
Documentation/process/coding-style.rst.

> +	if (!good_agpt && force_gpt && state->force_gpt_sector)
> +		good_agpt = is_gpt_valid(state, state->force_gpt_sector,
> +					 &agpt, &aptes);
> +
>          /* The obviously unsuccessful case */
>          if (!good_pgpt && !good_agpt)
>                  goto fail;

thanks.
-- 
~Randy
