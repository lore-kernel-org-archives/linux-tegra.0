From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 4/6] partitions/efi: Support GPT entry lookup at a
 non-standard location
Date: Sat, 16 May 2020 19:50:24 +0300
Message-ID: <595392b8-d950-4be6-f6cf-e274b4760b94@gmail.com>
References: <20200516153644.13748-1-digetx@gmail.com>
 <20200516153644.13748-5-digetx@gmail.com>
 <2ae298ca-016a-8867-52dd-86d99b9e0f3b@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2ae298ca-016a-8867-52dd-86d99b9e0f3b-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Nils_=c3=96stlund?= <nils-ElENwYY5mljQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Steve McIntyre <steve-nt0JYOx6u4DQT0dZR+AlfA@public.gmane.org>, linux-efi <linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

16.05.2020 18:51, Randy Dunlap пишет:
> On 5/16/20 8:36 AM, Dmitry Osipenko wrote:
>> diff --git a/block/partitions/efi.c b/block/partitions/efi.c
>> index b64bfdd4326c..3af4660bc11f 100644
>> --- a/block/partitions/efi.c
>> +++ b/block/partitions/efi.c
>> @@ -621,6 +621,14 @@ static int find_valid_gpt(struct parsed_partitions *state, gpt_header **gpt,
>>          if (!good_agpt && force_gpt)
>>                  good_agpt = is_gpt_valid(state, lastlba, &agpt, &aptes);
>>  
>> +	/* The force_gpt_sector is used by NVIDIA Tegra partition parser in
>> +	 * order to convey a non-standard location of the GPT entry for lookup.
>> +	 * By default force_gpt_sector is set to 0 and has no effect.
>> +	 */
> 
> Please fix the multi-line comment format as described in
> Documentation/process/coding-style.rst.
> 
>> +	if (!good_agpt && force_gpt && state->force_gpt_sector)
>> +		good_agpt = is_gpt_valid(state, state->force_gpt_sector,
>> +					 &agpt, &aptes);
>> +
>>          /* The obviously unsuccessful case */
>>          if (!good_pgpt && !good_agpt)
>>                  goto fail;
> 
> thanks.
> 

Hello Randy,

I know that it's not a proper kernel-style formatting, but that's the
style used by the whole efi.c source code and I wanted to maintain the
same style, for consistency. Of course I can change to a proper style if
it's more desirable than the consistency. Thank you for the comment!
