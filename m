From: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] clk: tegra: check BPMP response return code
Date: Mon, 2 Oct 2017 11:43:28 +0300
Message-ID: <8f0a0069-bbaf-51b2-b632-2d907c5f83d2@nvidia.com>
References: <cover.1504776489.git.talho@nvidia.com>
 <6a69e270519fd1c7a12a335053bf59671abc3c4b.1504776489.git.talho@nvidia.com>
 <388e07bc-b7b4-cc17-026a-bd08d77942ca@nvidia.com>
 <fc9729a7-53fb-f609-be6a-6454cc69548f@nvidia.com>
 <5dfbbc6d-0dc0-7d92-0bff-8b05ddd272b3@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5dfbbc6d-0dc0-7d92-0bff-8b05ddd272b3-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



On 29.09.2017 17:53, Jonathan Hunter wrote:
> 
> On 29/09/17 14:46, Timo Alho wrote:
>> Hi Jon,
>>
>> On 21.09.2017 14:21, Jonathan Hunter wrote:
>>>
>>>
>>> On 07/09/17 10:31, Timo Alho wrote:
>>>> Check return code in BPMP response message(s). The typical error case
>>>> is when clock operation is attempted with invalid clock identifier.
>>>>
>>>> Also remove error print from call to clk_get_info() as the
>>>> implementation loops through range of all possible identifier, but the
>>>> operation is expected error out when the clock id is unused.
>>>>
>>>> Signed-off-by: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>>    drivers/clk/tegra/clk-bpmp.c | 15 ++++++++++-----
>>>>    1 file changed, 10 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/tegra/clk-bpmp.c b/drivers/clk/tegra/clk-bpmp.c
>>>> index 638ace6..a896692 100644
>>>> --- a/drivers/clk/tegra/clk-bpmp.c
>>>> +++ b/drivers/clk/tegra/clk-bpmp.c
>>>> @@ -55,6 +55,7 @@ struct tegra_bpmp_clk_message {
>>>>        struct {
>>>>            void *data;
>>>>            size_t size;
>>>> +        int ret;
>>>>        } rx;
>>>>    };
>>>>    @@ -64,6 +65,7 @@ static int tegra_bpmp_clk_transfer(struct
>>>> tegra_bpmp *bpmp,
>>>>        struct mrq_clk_request request;
>>>>        struct tegra_bpmp_message msg;
>>>>        void *req = &request;
>>>> +    int err;
>>>>          memset(&request, 0, sizeof(request));
>>>>        request.cmd_and_id = (clk->cmd << 24) | clk->id;
>>>> @@ -84,7 +86,13 @@ static int tegra_bpmp_clk_transfer(struct
>>>> tegra_bpmp *bpmp,
>>>>        msg.rx.data = clk->rx.data;
>>>>        msg.rx.size = clk->rx.size;
>>>>    -    return tegra_bpmp_transfer(bpmp, &msg);
>>>> +    err = tegra_bpmp_transfer(bpmp, &msg);
>>>> +    if (err < 0)
>>>> +        return err;
>>>> +    else if (msg.rx.ret < 0)
>>>> +        return -EINVAL;
>>>
>>> I assume that the error codes returned do not correlated to the Linux
>>> error codes here. Is that correct? If not we could just return the
>>> actual error code. Otherwise would it be useful to print a message with
>>> the bpmp error code for debug?
>>
>> The error codes are not 1:1 match with Linux. Unfortunately, printing
>> message for debug is not either viable as during clock probing we are
>> expecting many of the calls to return -BPMP_EINVAL to indicate that
>> particular clock ID is unused.
> 
> OK. Could it return other errors other than BPMP_EINVAL? I am just
> wondering if we need to differentiate between unused and an actual
> error? Maybe that is not possible here?

Other error codes are possible (though they are not explicitly 
documented in abi header). It's not easy to differentiate the error code 
at this level: -BPMP_EINVAL is "expected" condition with 
CMD_CLK_GET_ALL_INFO, whereas -BPMP_EINVAL is true error on other commands.
