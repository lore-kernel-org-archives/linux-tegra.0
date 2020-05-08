From: Marion & Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Subject: Re: [PATCH] memory: tegra: Fix an error handling path in
 'tegra186_emc_probe()'
Date: Fri, 8 May 2020 11:31:18 +0200
Message-ID: <b4b55c4b-1aff-6272-b15c-67466ee1706e@wanadoo.fr>
References: <20200506200907.195502-1-christophe.jaillet@wanadoo.fr>
 <20200508084941.GE9365@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200508084941.GE9365@kadam>
Content-Language: fr
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


Le 08/05/2020 à 10:49, Dan Carpenter a écrit :
> On Wed, May 06, 2020 at 10:09:07PM +0200, Christophe JAILLET wrote:
>> @@ -237,7 +239,7 @@ static int tegra186_emc_probe(struct platform_device *pdev)
>>   			"failed to set rate range [%lu-%lu] for %pC\n",
>>   			emc->debugfs.min_rate, emc->debugfs.max_rate,
>>   			emc->clk);
>> -		return err;
>> +		goto err_put_bpmp;
>>   	}
>>   
>>   	emc->debugfs.root = debugfs_create_dir("emc", NULL);
> Not really related to this patch but the error handling on this
> debugfs_create_dir() call is wrong.  It never returns NULL.  The error
> should just be ignored.  It shouldn't try print a message when debugfs
> is deliberately disabled.
>
> As in the correct code looks like:
>
>   
>          emc->debugfs.root = debugfs_create_dir("emc", NULL);
> -       if (!emc->debugfs.root) {
> -               dev_err(&pdev->dev, "failed to create debugfs directory\n");
> -               return 0;
> -       }
> -
>          debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root,
>                              emc, &tegra186_emc_debug_available_rates_fops);
>          debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
>
> debugfs_create_file() will return an error pointer if debugfs_create_dir()
> fails or if debugfs is disabled.  (It is a no-op).
>
> regards,
> dan carpenter

LGTM.

I let you propose a patch for it,.

CJ
