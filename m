Return-Path: <SRS0=64AB=DP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05657C4363A
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 13:06:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98F0B2145D
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 13:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602162383;
	bh=2lDf35uHFZosEIVYa7uiAybKH2YKzlzLSzz7E16+iTM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=m0wsIq/S3fe4Dut0u4MlZm3rAKGnVWi1/SVrFlW9hPjD8C5IUx4cMlUA2QooKuG2G
	 NiI/Ysj0nos0i0CGp4NQjNzKkv+CSNKCbQtHEaMhp3AiWeDrouW7Py/s7is1+vj59g
	 zTNlv6o+Cl79Q0vbVs3dwn28imLLwzWXMRrqUNp0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730190AbgJHNGX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Oct 2020 09:06:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:39484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730146AbgJHNGX (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 8 Oct 2020 09:06:23 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A58382083B;
        Thu,  8 Oct 2020 13:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602162381;
        bh=2lDf35uHFZosEIVYa7uiAybKH2YKzlzLSzz7E16+iTM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dvbxheAZiHonPfftSbghLP4gXTbyJNpkXoFFeu8P7RgkZdrZNSEbzbNDhmZjCXgpk
         JJFhlue8V89P8adodQ+BM3NufGvRZEFFYTT1p3mvhTFmun0WO28s4fJC1tAN9J3Hfr
         9a3H3zZens5u2iwHuJUYkw/k5BywPG6Lp054Gk6Q=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1kQVch-000hXN-JE; Thu, 08 Oct 2020 14:06:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 08 Oct 2020 14:06:19 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Venkat Reddy Talla <vreddytalla@nvidia.com>,
        kernel-team@android.com
Subject: Re: [PATCH v3 1/4] genirq/irqdomain: Allow partial trimming of
 irq_data hierarchy
In-Reply-To: <87d01t2c90.fsf@nanos.tec.linutronix.de>
References: <20201007124544.1397322-1-maz@kernel.org>
 <20201007124544.1397322-2-maz@kernel.org>
 <87d01t2c90.fsf@nanos.tec.linutronix.de>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <9341eb039193d630d8a3f7bac920a76c@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: tglx@linutronix.de, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, skomatineni@nvidia.com, vreddytalla@nvidia.com, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-10-08 12:22, Thomas Gleixner wrote:
> On Wed, Oct 07 2020 at 13:45, Marc Zyngier wrote:
>> +/**
>> + * irq_domain_trim_hierarchy - Trim the uninitialized part of a irq 
>> hierarchy
>> + * @virq:	IRQ number to trim where the hierarchy is to be trimmed
>> + *
>> + * Drop the partial irq_data hierarchy from the level where the
>> + * irq_data->chip is NULL.
>> + *
>> + * Its only use is to be able to trim levels of hierarchy that do not
>> + * have any real meaning for this interrupt, and that the driver 
>> leaves
>> + * uninitialized in its .alloc() callback.
>> + */
>> +static void irq_domain_trim_hierarchy(unsigned int virq)
>> +{
>> +	struct irq_data *tail, *irq_data = irq_get_irq_data(virq);
>> +
>> +	/* It really needs to be a hierarchy, and not a single entry */
>> +	if (!irq_data->parent_data)
>> +		return;
>> +
>> +	/* Skip until we find a parent irq_data without a populated chip */
>> +	while (irq_data->parent_data && irq_data->parent_data->chip)
>> +		irq_data = irq_data->parent_data;
>> +
>> +	/* All levels populated */
>> +	if (!irq_data->parent_data)
>> +		return;
>> +
>> +	pr_info("IRQ%d: trimming hierarchy from %s\n",
>> +		virq, irq_data->parent_data->domain->name);
>> +
>> +	/* Sever the inner part of the hierarchy...  */
>> +	tail = irq_data->parent_data;
>> +	irq_data->parent_data = NULL;
>> +	__irq_domain_free_hierarchy(tail);
>> +}
> 
> I like that way more than the previous version, but there are still
> quite some dangeroos waiting to bite.
> 
> Just for robustness sake we should do the following:

[...]

Here's what I have now, with the pmc driver calling
irq_domain_disconnect_hierarchy() at the right spots.

         M.

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index b37350c4fe37..a52b095bd404 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -509,6 +509,9 @@ extern void irq_domain_free_irqs_parent(struct 
irq_domain *domain,
  					unsigned int irq_base,
  					unsigned int nr_irqs);

+extern int irq_domain_disconnect_hierarchy(struct irq_domain *domain,
+					   unsigned int virq);
+
  static inline bool irq_domain_is_hierarchy(struct irq_domain *domain)
  {
  	return domain->flags & IRQ_DOMAIN_FLAG_HIERARCHY;
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 76cd7ebd1178..316f5baa9cd9 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1136,6 +1136,17 @@ static struct irq_data 
*irq_domain_insert_irq_data(struct irq_domain *domain,
  	return irq_data;
  }

+static void __irq_domain_free_hierarchy(struct irq_data *irq_data)
+{
+	struct irq_data *tmp;
+
+	while (irq_data) {
+		tmp = irq_data;
+		irq_data = irq_data->parent_data;
+		kfree(tmp);
+	}
+}
+
  static void irq_domain_free_irq_data(unsigned int virq, unsigned int 
nr_irqs)
  {
  	struct irq_data *irq_data, *tmp;
@@ -1147,12 +1158,81 @@ static void irq_domain_free_irq_data(unsigned 
int virq, unsigned int nr_irqs)
  		irq_data->parent_data = NULL;
  		irq_data->domain = NULL;

-		while (tmp) {
-			irq_data = tmp;
-			tmp = tmp->parent_data;
-			kfree(irq_data);
+		__irq_domain_free_hierarchy(tmp);
+	}
+}
+
+int irq_domain_disconnect_hierarchy(struct irq_domain *domain,
+				    unsigned int virq)
+{
+	struct irq_data *irqd;
+
+	irqd = irq_domain_get_irq_data(domain, virq);
+	if (!irqd)
+		return -EINVAL;
+
+	irqd->chip = ERR_PTR(-ENOTCONN);
+	return 0;
+}
+
+/**
+ * irq_domain_trim_hierarchy - Trim the uninitialized part of a irq 
hierarchy
+ * @virq:	IRQ number to trim where the hierarchy is to be trimmed
+ *
+ * Drop the partial irq_data hierarchy from the level where the
+ * irq_data->chip is a trim marker (PTR_ERR(-ENOTCONN)).
+ *
+ * Its only use is to be able to trim levels of hierarchy that do not
+ * have any real meaning for this interrupt, and that the driver marks
+ * as such from its .alloc() callback.
+ */
+static int irq_domain_trim_hierarchy(unsigned int virq)
+{
+	struct irq_data *tail, *irqd, *irq_data;
+
+	irq_data = irq_get_irq_data(virq);
+	tail = NULL;
+
+	/* The first entry must have a valid irqchip */
+	if (!irq_data->chip || IS_ERR(irq_data->chip))
+		return -EINVAL;
+
+	/*
+	 * Validate that the irq_data chain is sane in the presence of
+	 * a hierarchy trimming marker.
+	 */
+	for (irqd = irq_data->parent_data; irqd; irq_data = irqd, irqd = 
irqd->parent_data) {
+		/* Can't have a valid irqchip after a trim marker */
+		if (irqd->chip && tail)
+			return -EINVAL;
+
+		/* Can't have an empty irqchip before a trim marker */
+		if (!irqd->chip && !tail)
+			return -EINVAL;
+
+		if (IS_ERR(irqd->chip)) {
+			/* Only -ENOTCONN is a valid trim marker */
+			if (PTR_ERR(irqd->chip) != -ENOTCONN)
+				return -EINVAL;
+
+			tail = irq_data;
  		}
  	}
+
+	/* No trim marker, nothing to do */
+	if (!tail)
+		return 0;
+
+	pr_info("IRQ%d: trimming hierarchy from %s\n",
+		virq, tail->parent_data->domain->name);
+
+	/* Sever the inner part of the hierarchy...  */
+	irqd = tail;
+	tail = tail->parent_data;
+	irqd->parent_data = NULL;
+	__irq_domain_free_hierarchy(tail);
+
+	return 0;
  }

  static int irq_domain_alloc_irq_data(struct irq_domain *domain,
@@ -1362,11 +1442,16 @@ int __irq_domain_alloc_irqs(struct irq_domain 
*domain, int irq_base,
  		mutex_unlock(&irq_domain_mutex);
  		goto out_free_irq_data;
  	}
-	for (i = 0; i < nr_irqs; i++)
+	for (i = 0; i < nr_irqs; i++) {
+		ret = irq_domain_trim_hierarchy(virq + i);
+		if (ret)
+			break;
  		irq_domain_insert_irq(virq + i);
+	}
  	mutex_unlock(&irq_domain_mutex);

-	return virq;
+	if (!ret)
+		return virq;

  out_free_irq_data:
  	irq_domain_free_irq_data(virq, nr_irqs);

-- 
Jazz is not dead. It just smells funny...
