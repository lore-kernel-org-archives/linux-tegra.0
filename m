From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux scripts PATCH] board-to-kernel-dt: don't generate outer
 state node
Date: Thu, 14 May 2015 09:57:05 -0600
Message-ID: <5554C5D1.3040302@wwwdotorg.org>
References: <1431613216-19745-1-git-send-email-swarren@wwwdotorg.org> <CAPnjgZ0H+LwDSoMTCMNnKe+4LjwRF8kT7EE5O+GDkCr7eWDHTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ0H+LwDSoMTCMNnKe+4LjwRF8kT7EE5O+GDkCr7eWDHTA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/14/2015 08:29 AM, Simon Glass wrote:
> On 14 May 2015 at 08:20, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> The important thing for board-to-kernel-dt to generate is the content of
>> the pinmux "state" node in DT. The name and label of the node that
>> contains this information is essentially irrelevant. Since this
>> irrelevant name and label varies between boards in existing DTs, update
>> board-to-kernel-dt so it doesn't generate it. This makes it obvious that
>> the name and label shouldn't be modified when importing new versions of
>> board-to-kernel-dt's output.
>>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   board-to-kernel-dt.py | 4 ----
>>   1 file changed, 4 deletions(-)
>
> Reviewed-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

I've applied this.
