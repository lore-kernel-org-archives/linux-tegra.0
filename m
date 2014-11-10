From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/5 v2] set: check seek success
Date: Mon, 10 Nov 2014 09:31:55 -0700
Message-ID: <5460E87B.1040209@wwwdotorg.org>
References: <1412237788-20611-1-git-send-email-patrick@georgi-clan.de> <545E95B1.5030703@georgi-clan.de> <20141110085102.GA12126@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141110085102.GA12126@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/10/2014 01:51 AM, Thierry Reding wrote:
> On Sat, Nov 08, 2014 at 11:14:09PM +0100, Patrick Georgi wrote:
>> This could silently fail which leads to surprising behaviour.
>>
>> Found-by: Coverity Scan
>> Signed-off-by: Patrick Georgi <patrick-U1IrdZU7gScKt1dFYRw6Gg@public.gmane.org>
>> ---
>>   src/set.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/src/set.c b/src/set.c
>> index ff32b53..907d640 100644
>> --- a/src/set.c
>> +++ b/src/set.c
>> @@ -59,7 +59,11 @@ read_from_image(char	*filename,
>>   		return result;
>>   	}
>>
>> -	fseek(fp, offset, SEEK_SET);
>> +	if (fseek(fp, offset, SEEK_SET) == -1) {
>> +		printf("Error: Couldn't seek to %s(%d)\n", filename, offset);
>
> offset is unsigned, so the format specifier should be %u. I also wonder
> whether it would be good to output errno along with the message (or the
> string representation thereof) to increase the information content. But
> given that none of the other error messages have that it could be a
> separate patch.

Using perror() might be useful?
