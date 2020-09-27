Return-Path: <SRS0=p7a/=DE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE679C4346E
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Sep 2020 07:17:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AABE239EE
	for <linux-tegra@archiver.kernel.org>; Sun, 27 Sep 2020 07:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601191026;
	bh=HX9DYilVdjl81SYZGde2+NORXROnPG5rTXaPPd4GuIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=lij0+bJPHpOr5ul3nnKWh1oqEOUi5LRRr+tUngnvJCevhG9NAmwckqLGWALlDMdmO
	 WC8VBdLzvYt3Dmhm6M9WuH1ZKcF0Kl4S77os5S54rR+T/2JIbmndepNwAgouHQG4hy
	 qRhhdBdeWabKrm1BuAxu+0Ze1i8ZpjKKir/FzK6o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728580AbgI0HRG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 27 Sep 2020 03:17:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:50650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726478AbgI0HRF (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 27 Sep 2020 03:17:05 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 77BD623899;
        Sun, 27 Sep 2020 07:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601191025;
        bh=HX9DYilVdjl81SYZGde2+NORXROnPG5rTXaPPd4GuIw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T4BbFboXHIGplvJ3nAg22giLM6xhnFh7uQbdn+fAc6g1J67xgNmriccekjjShtklO
         IIFD8iJAUX81KD4jIIba9fe580J7Y4wNshP1X7FMTbd62TCHjgOsk334Jb1qOB6oRW
         +cpJHRzXQQ0b5muh7g5FN/NbHZUiSKQ7DVYFTiLc=
Date:   Sun, 27 Sep 2020 09:17:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ryan Kosta <ryanpkosta@gmail.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        marvin24@gmx.de, p.zabel@pengutronix.de,
        linux-tegra@vger.kernel.org, ac100@lists.launchpad.net
Subject: Re: [PATCH] fix double next comment in drivers/staging/nvec/nvec.c
Message-ID: <20200927071701.GA713623@kroah.com>
References: <20200927063937.14614-1-ryanpkosta@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927063937.14614-1-ryanpkosta@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Sep 26, 2020 at 11:39:37PM -0700, Ryan Kosta wrote:
> Signed-off-by: Ryan Kosta <ryanpkosta@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 360ec040774..a80996b2f5c 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -289,7 +289,7 @@ EXPORT_SYMBOL(nvec_write_async);
>   * interrupt handlers.
>   *
>   * Returns: 0 on success, a negative error code on failure.
> - * The response message is returned in @msg. Shall be freed with
> + * The response message is returned in @msg. Shall be freed
>   * with nvec_msg_free() once no longer used.
>   *
>   */
> -- 
> 2.20.1


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
