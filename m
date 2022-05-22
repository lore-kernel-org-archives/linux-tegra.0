Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197D3C433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 22 May 2022 20:46:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349856AbiEVUqx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 22 May 2022 16:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344311AbiEVUqx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 22 May 2022 16:46:53 -0400
X-Greylist: delayed 3456 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 22 May 2022 13:46:52 PDT
Received: from out8.nocdirect.com (out8.nocdirect.com [69.73.171.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D6E1C115
        for <linux-tegra@vger.kernel.org>; Sun, 22 May 2022 13:46:52 -0700 (PDT)
Received: from binky.nswebhost.com ([69.73.168.248])
        by spamexperts03.nocdirect.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <support@iesottawa.ca>)
        id 1nsrZW-0000Yu-L7
        for linux-tegra@vger.kernel.org; Sun, 22 May 2022 15:49:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=iesottawa.ca; s=default; h=Sender:Content-Type:MIME-Version:Message-ID:
        Reply-To:From:Date:Subject:To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tsytaq9P6jbx84sZaeZ2ujyYY054YqWU2QI73VCcE8s=; b=1QBRWdJlvSciiJXpIyBgJr8Yzb
        jGm78LB+tp1EF4VM7y96MTlWfbRvClsSmnyg+mLQHjgLRm68RUsYcni8VGWbXKRx3DhDbRNuUxIoc
        RCkUp7kHmblUsb7KV3Ha+Xlm7As2Gos9/iR/v+dxsUDlTr2OLN9M06ejXNZ/UzpNn1VwWYJZWVWEV
        C8S1SRS1DUq/71EP/RWBQTaVkT542pCk/YcoaRDtwwtOqtMi3tx/UsxQB15LjhFNO6o1/hBjTvT8l
        F9CZZMdjwIb6BjHGCUcTVlF2+DzmRU4PLASe7WLzS1tHzTSP9Mg4yL32NDiuu6nN02Hf1vuXNiG1P
        9Fqx3Jkw==;
Received: from ottawa by binky.nswebhost.com with local (Exim 4.93)
        (envelope-from <support@iesottawa.ca>)
        id 1nsrYV-0007DH-Qw
        for linux-tegra@vger.kernel.org; Sun, 22 May 2022 15:47:59 -0400
To:     linux-tegra@vger.kernel.org
Subject: Re: Looking forward to hearing from you
X-PHP-Script: iesottawa.ca/modules/mod_simplefileuploadv1.3/elements/bcqkhulk.php for 36.37.185.70
Date:   Sun, 22 May 2022 19:47:59 +0000
From:   "Mrs. Mamand Mashamsul" <support@iesottawa.ca>
Reply-To: mrsmamands@gmail.com
Message-ID: <a428e5ba6d2e1a0652e2a40be4a06eeb@iesottawa.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Sender:  <ottawa@binky.nswebhost.com>
X-Originating-IP: 69.73.168.248
X-SpamExperts-Domain: nocdirect.com
X-SpamExperts-Username: binky
Authentication-Results: nocdirect.com; auth=pass (login) smtp.auth=binky@nocdirect.com
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.83)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9NxnHXhFI9aLFhf4G9YVDvPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wA43r3cfvHmcs4Rx5LmOSF7sSvgVJKSSRgWR/YKjxme6vp
 k7Vp2UXVHEQMIct0liKKW7Ze1HBdIQbvsJDcAqjgswKQDamPN66SYe4XX4xmgBmNBHh5pvNozdjh
 iHhZmV545HrG+QdOcOJIquGBCoT+FPFpN2RLz/kgT3u72mrWJwwndgZ7A9VaMcmOHUGxPuPdKkOQ
 dK671YcG8gfyEw8CCPAbTif+lMN0KnFDV3bj9f25Cgscc2Nqd9azmDa4ZbZiw5JjPOtY6QanNQmH
 LTEsFEqhVt2bN9kbtY/w/v96Z80ZzaHVG6aDAfQHGejUeogqwPhBGfIWcG1dlgie4czK+ALBoTKh
 tDOdgPMrGgl8Kl9f5nltzBu5Mel1xHfGM33mRO2CcIQVgm9T5haIwTso17NirEYyqwqMBGrw8ELi
 qChx0bleWOlLDMAnxS4rylxMoOwWpgS+Uzd9086q8LFx3BuobEUGYgCIMPs/N+wKoF+3sCPHtYe0
 SE4DdeAR5hlbf0XifTH4c85mykx+8CPRhFNbrTbJFADkQldlhWV9IyakJs2SXcjtEtM+Q1XlNT2k
 3lS1t6QdEPz08qMKOQH7QcDExXykVfIEY3BDD5agLclRnAOQovces36JgcEz2p7RAuyCCiUAdGGb
 IZMVC3JO0z6bhalFEM/pjPCQA+BAlj8axd1/3kfaOck5HEgBAijQNb3aj6LPzL00PLDnDV23bfKt
 LMmWUM30X/W/3JqOgm1YnHR6gNJNkxE1TSfJ0ihRXxKF5tPxTxfD0dMN+t5Z/UEpQGvqdUyw83wD
 kYEJ4voPFZIShBSdpVJW5HbjQTBAc0bhj93TlqmpkAxEY9eOlg+3QUD/FPYyl+rt3IUBvPC3idmU
 6VYXooszuAtjgcXKfm9DTQQJ2JCpAhEntKDY52lLO3rL7b7eSAtDZCdKq7ersPEwzLHnDjFb6ou1
 K+WepHGpQidTgsUIofwiqz5i
X-Report-Abuse-To: spam@spamexperts01.nocdirect.com
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Greatings Dear

I am Mrs. Mamand Mashamsul, from Kabul, Capital of Afghanistan. With due respect, I want to know if foreigners can buy and own properties in your beautiful country, I desire to relocate my investment capital abroad where it will generate more returns. 
 
I will appreciate your response. Please let me know your ideas and knowledge regarding my research. In Any viable investment idea you suggest to me will be also be considered. 
 
Looking forward to hearing from you.

Best regards,
Mrs. Mamand Mashamsul

