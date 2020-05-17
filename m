From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 4/6] partitions/efi: Support GPT entry lookup at a
 non-standard location
Date: Sat, 16 May 2020 19:07:42 -0700
Message-ID: <27b18ce5-1f73-3acd-ed84-87f98498b256@infradead.org>
References: <20200516153644.13748-1-digetx@gmail.com>
 <20200516153644.13748-5-digetx@gmail.com>
 <2ae298ca-016a-8867-52dd-86d99b9e0f3b@infradead.org>
 <595392b8-d950-4be6-f6cf-e274b4760b94@gmail.com>
 <4a0f6a9c-b652-598a-c8a0-580a3e98171b@infradead.org>
 <68d36582-5a47-11b4-360a-ceb2e272e459@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-block-owner@vger.kernel.org>
In-Reply-To: <68d36582-5a47-11b4-360a-ceb2e272e459@gmail.com>
Content-Language: en-US
Sender: linux-block-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, =?UTF-8?Q?Nils_=c3=96stlund?= <nils@naltan.com>, Christoph Hellwig <hch@infradead.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Davidlohr Bueso <dave@stgolabs.net>
Cc: linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Steve McIntyre <steve@einval.com>, linux-efi <linux-efi@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 5/16/20 5:11 PM, Dmitry Osipenko wrote:
> 16.05.2020 19:58, Randy Dunlap пишет:
>> On 5/16/20 9:50 AM, Dmitry Osipenko wrote:
>>> 16.05.2020 18:51, Randy Dunlap пишет:
>>>> On 5/16/20 8:36 AM, Dmitry Osipenko wrote:
>>>>> diff --git a/block/partitions/efi.c b/block/partitions/efi.c
>>>>> index b64bfdd4326c..3af4660bc11f 100644
>>>>> --- a/block/partitions/efi.c
>>>>> +++ b/block/partitions/efi.c
>>>>> @@ -621,6 +621,14 @@ static int find_valid_gpt(struct parsed_partitions *state, gpt_header **gpt,
>>>>>          if (!good_agpt && force_gpt)
>>>>>                  good_agpt = is_gpt_valid(state, lastlba, &agpt, &aptes);
>>>>>  
>>>>> +	/* The force_gpt_sector is used by NVIDIA Tegra partition parser in
>>>>> +	 * order to convey a non-standard location of the GPT entry for lookup.
>>>>> +	 * By default force_gpt_sector is set to 0 and has no effect.
>>>>> +	 */
>>>>
>>>> Please fix the multi-line comment format as described in
>>>> Documentation/process/coding-style.rst.
>>>>
>>>>> +	if (!good_agpt && force_gpt && state->force_gpt_sector)
>>>>> +		good_agpt = is_gpt_valid(state, state->force_gpt_sector,
>>>>> +					 &agpt, &aptes);
>>>>> +
>>>>>          /* The obviously unsuccessful case */
>>>>>          if (!good_pgpt && !good_agpt)
>>>>>                  goto fail;
>>>>
>>>> thanks.
>>>>
>>>
>>> Hello Randy,
>>>
>>> I know that it's not a proper kernel-style formatting, but that's the
>>> style used by the whole efi.c source code and I wanted to maintain the
>>> same style, for consistency. Of course I can change to a proper style if
>>> it's more desirable than the consistency. Thank you for the comment!
>>>
>>
>> too bad. Sorry to hear that.
>> It should have been "fixed" much earlier.
>> It's probably too late now.
> 
> Actually, I now see that there is a mix of different comment styles in
> the efi.c code. So it should be fine to use the proper style, I'll
> change it in v6.
> 
> I don't think it's too late, it's never late to make a correction :)
> There are some other coding style problems in the efi.c that won't hurt
> to fix, I may take a look at fixing them later on.
> 

OK, great. Thanks.

-- 
~Randy
